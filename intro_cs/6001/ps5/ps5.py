# 6.0001/6.00 Problem Set 5 - RSS Feed Filter
# Name:
# Collaborators:
# Time:

import feedparser
import string
import time
import threading
from project_util import translate_html
from mtTkinter import *
from datetime import datetime
import pytz
import re
#-----------------------------------------------------------------------

#======================
# Code for retrieving and parsing
# Google and Yahoo News feeds
# Do not change this code
#======================

def process(url):
    """
    Fetches news items from the rss url and parses them.
    Returns a list of NewsStory-s.
    """
    feed = feedparser.parse(url)
    entries = feed.entries
    ret = []
    for entry in entries:
        guid = entry.guid
        title = translate_html(entry.title)
        link = entry.link
        
        pubdate = translate_html(entry.published)

        try:
            description = translate_html(entry.description)
        except Exception as e:
            description =  title
            print(e)


        try:
            pubdate = datetime.strptime(pubdate, "%a, %d %b %Y %H:%M:%S %Z")
            pubdate.replace(tzinfo=pytz.timezone("GMT"))
          #  pubdate = pubdate.astimezone(pytz.timezone('EST'))
          #  pubdate.replace(tzinfo=None)
        except ValueError:
            pubdate = datetime.strptime(pubdate, "%Y-%m-%dT%H:%M:%S%z")

        newsStory = NewsStory(guid, title, description, link, pubdate)
        ret.append(newsStory)
    return ret

#======================
# Data structure design
#======================

# Problem 1

# TODO: NewsStory

class NewsStory():

    def __init__(self,guid, title, description,link, pubdate):
        self.guid = guid
        self.title = title
        self.description = description
        self.link = link
        self.pubdate = pubdate

    def get_guid(self):
        return self.guid
    
    def get_title(self):
        return self.title
    
    def get_description(self):
        return self.description
    def get_link(self):
        return self.link
    
    def get_pubdate(self):
        return self.pubdate
    
#======================
# Triggers
#======================

class Trigger(object):
    def evaluate(self, story):
        """
        Returns True if an alert should be generated
        for the given news item, or False otherwise.
        """
        # DO NOT CHANGE THIS!
        raise NotImplementedError

# PHRASE TRIGGERS

# Problem 2
# TODO: PhraseTrigger
class PhraseTrigger(Trigger):
    def __init__(self,phrase):
     
        self.phrase = phrase.lower()

    def is_phrase_in(self,text):
        text = text.lower()
       
        nextext = ''
        space_count = 0
        for x in text:
            if x in string.punctuation or x == ' ' :
                if space_count == 0:
                    nextext += ' '
                    space_count = 1
            else:
                nextext += x
                space_count = 0
        nextext += ' '
        a = re.search(rf"\s?{re.escape(self.phrase)}\s",nextext)
        if a:
            return True
        return False

# Problem 3
# TODO: TitleTrigger
class TitleTrigger(PhraseTrigger):
    
    def __init__(self, phrase):
        PhraseTrigger.__init__(self, phrase)    

    def evaluate(self, story):
        title = story.get_title()
        return self.is_phrase_in(title)
# Problem 4
# TODO: DescriptionTrigger
class DescriptionTrigger(PhraseTrigger):
    
    def __init__(self, phrase):
        PhraseTrigger.__init__(self, phrase)    

    def evaluate(self, story):
        des = story.get_description()
        return self.is_phrase_in(des)
# TIME TRIGGERS

# Problem 5
# TODO: TimeTrigger
# Constructor:
#        Input: Time has to be in EST and in the format of "%d %b %Y %H:%M:%S".
#        Convert time from string to a datetime before saving it as an attribute.
    
class TimeTrigger(Trigger):
    def __init__(self, timeString):
        
        
        unawaretime = datetime.strptime(timeString, "%d %b %Y %H:%M:%S")
        self.timeString = unawaretime.replace(tzinfo=pytz.timezone("EST"))


# Problem 6
# TODO: BeforeTrigger and AfterTrigger
class BeforeTrigger(TimeTrigger):
    def __init__(self, timeString):
        TimeTrigger.__init__(self, timeString)

    def evaluate(self, story):
        pubdate = story.get_pubdate()
        pubdate = pubdate.replace(tzinfo=pytz.timezone("EST"))

        if pubdate < self.timeString:
            return True
        return False
    
class AfterTrigger(TimeTrigger):
    def __init__(self, timeString):
        TimeTrigger.__init__(self, timeString)

    def evaluate(self, story):
        pubdate = story.get_pubdate()
        pubdate = pubdate.replace(tzinfo=pytz.timezone("EST"))
        if pubdate > self.timeString:
            return True
        return False


# COMPOSITE TRIGGERS

# Problem 7
# TODO: NotTrigger
class NotTrigger(Trigger):
    def __init__(self, otherTrigger):
        self.otherTrigger = otherTrigger

    def evaluate(self, story):
        return not self.otherTrigger.evaluate(story)    


# Problem 8
# TODO: AndTrigger
class AndTrigger(Trigger):
    def __init__(self, firstTrigger,secondTrigger):
        self.firstTrigger = firstTrigger
        self.secondTrigger = secondTrigger

    def evaluate(self, story):
        return  self.firstTrigger.evaluate(story) and self.secondTrigger.evaluate(story)



# Problem 9
# TODO: OrTrigger
class OrTrigger(Trigger):
    def __init__(self, firstTrigger,secondTrigger):
        self.firstTrigger = firstTrigger
        self.secondTrigger = secondTrigger

    def evaluate(self, story):
        return  self.firstTrigger.evaluate(story) or self.secondTrigger.evaluate(story)


#======================
# Filtering
#======================

# Problem 10
def filter_stories(stories, triggerlist):
    """
    Takes in a list of NewsStory instances.

    Returns: a list of only the stories for which a trigger in triggerlist fires.
    """
    # TODO: Problem 10
    # This is a placeholder
    # (we're just returning all the stories, with no filtering)

    list_of_stories = []
    for story in stories:
        for trigger in triggerlist:
            if trigger.evaluate(story):
                list_of_stories.append(story)


    return list_of_stories



#======================
# User-Specified Triggers
#======================
# Problem 11
def read_trigger_config(filename):
    """
    filename: the name of a trigger configuration file

    Returns: a list of trigger objects specified by the trigger configuration
        file.
    """
    # We give you the code to read in the file and eliminate blank lines and
    # comments. You don't need to know how it works for now!
    trigger_file = open(filename, 'r')
    lines = []
    for line in trigger_file:
        line = line.rstrip()
        if not (len(line) == 0 or line.startswith('//')):
            lines.append(line)

    # TODO: Problem 11
    # line is the list of lines that you need to parse and for which you need
    # to build triggers
            
    triggers = {} 
    triggerList = []      
    for trigger in lines:
        print(trigger)
        if trigger[0] != 'ADD':
            match_case = trigger[1]
            match match_case:
                case 'TITLE':
                    triggers[trigger[0]] = TitleTrigger(trigger[2])
                  
                    break
                case 'DESCRIPTION':
                    triggers[trigger[0]] =DescriptionTrigger(trigger[2])
                    break
                case "AFTER":
                    triggers[trigger[0]] =AfterTrigger(trigger[2])
                    break
                case "BEFORE":
                    triggers[trigger[0]] =BeforeTrigger(trigger[2])
                    break
                case "NOT":
                    triggers[trigger[0]] = NotTrigger(triggers[trigger[2]])
                case "AND":
                    triggers[trigger[0]] =AndTrigger(trigger[2], trigger[3])
                case "OR":
                    triggers[trigger[0]] =OrTrigger(trigger[2], trigger[3])
        if trigger[0] == 'ADD':
            for t in trigger:
                if t == 'ADD':
                    continue
                else:
                    if triggerList.get(triggerList[t]) is not None:
                        triggerList.append(triggerList[t])




    print(lines) # for now, print it so you see what it contains!
    return triggerList


SLEEPTIME = 120 #seconds -- how often we poll

def main_thread(master):
    # A sample trigger list - you might need to change the phrases to correspond
    # to what is currently in the news
    try:
        t1 = TitleTrigger("Trump")
        t2 = DescriptionTrigger("Trump")
        t3 = DescriptionTrigger("Biden")
        t4 = AndTrigger(t2, t3)
        triggerlist = [t1, t4]

        # Problem 11
        # TODO: After implementing read_trigger_config, uncomment this line 
        triggerlist = read_trigger_config('triggers.txt')
        print(triggerlist)
        # HELPER CODE - you don't need to understand this!
        # Draws the popup window that displays the filtered stories
        # Retrieves and filters the stories from the RSS feeds
        frame = Frame(master)
        frame.pack(side=BOTTOM)
        scrollbar = Scrollbar(master)
        scrollbar.pack(side=RIGHT,fill=Y)

        t = "Google & Yahoo Top News"
        title = StringVar()
        title.set(t)
        ttl = Label(master, textvariable=title, font=("Helvetica", 18))
        ttl.pack(side=TOP)
        cont = Text(master, font=("Helvetica",14), yscrollcommand=scrollbar.set)
        cont.pack(side=BOTTOM)
        cont.tag_config("title", justify='center')
        button = Button(frame, text="Exit", command=root.destroy)
        button.pack(side=BOTTOM)
        guidShown = []
        def get_cont(newstory):
            if newstory.get_guid() not in guidShown:
                cont.insert(END, newstory.get_title()+"\n", "title")
                cont.insert(END, "\n---------------------------------------------------------------\n", "title")
                cont.insert(END, newstory.get_description())
                cont.insert(END, "\n*********************************************************************\n", "title")
                guidShown.append(newstory.get_guid())

        while True:

            print("Polling . . .", end=' ')
            # Get stories from Google's Top Stories RSS news feed
            stories = process("http://news.google.com/news?output=rss")

            # Get stories from Yahoo's Top Stories RSS news feed
            stories.extend(process("http://news.yahoo.com/rss/topstories"))
            # print(process("http://news.yahoo.com/rss/topstories"))

            stories = filter_stories(stories, triggerlist)

            list(map(get_cont, stories))
            scrollbar.config(command=cont.yview)


            print("Sleeping...")
            time.sleep(SLEEPTIME)

    except Exception as e:
        print(e)


if __name__ == '__main__':
    root = Tk()
    root.title("Some RSS parser")
    t = threading.Thread(target=main_thread, args=(root,))
    t.start()
    root.mainloop()

