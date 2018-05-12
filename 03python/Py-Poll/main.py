
# -------------------------------- -----------------------------------------------------------------------------------------
# -----------------------------------------------------------------------------------------
## Option 2: PyPoll

fn = 'election_data_1.csv'
f = open(fn)

# create a dict
votes_dict = {}

# loop through the file data
# read the first line
headers = f.readline()

total_votes = 0
for line in f:
    line = line.rstrip()
    row_items = line.split(',')  # get ID, County, Candidate name
    candidate = row_items[2]
    if candidate in votes_dict:
        votes_dict[candidate] += 1
    else:
        votes_dict[candidate] = 1
    total_votes += 1
        
# output header
s = 'Election Results\n'
s += '-------------------------\n'

# The total number of votes cast
tot_votes_str = 'Total Votes: %d\n' % total_votes
s += tot_votes_str

# A complete list of candidates who received votes
# The percentage of votes each candidate won
# The total number of votes each candidate won

# output candidate results
max_votes = 0
leader = None
for candidate, vote_count in votes_dict.items():
    if vote_count > max_votes:
        max_votes = vote_count
        leader = candidate
    fraction_of_total = vote_count / total_votes
    percent_of_total = fraction_of_total * 100
    cand_str = '%s: %0.1f%% (%d)\n' % (candidate, percent_of_total, vote_count)
    s += cand_str
    
s += '-------------------------\n'
winner_str = 'Winner: %s\n' % leader
s += winner_str
s += '-------------------------\n'

print(s)
f.close()

# output results to a file
fn_root = fn[0:-4]
fn_out = fn_root + '_results.txt'
fout = open(fn_out, 'w')
fout.write(s)
fout.close()---------------------------------------------------------
## Option 2: PyPoll

fn = 'election_data_1.csv'
f = open(fn)

# create a dict
votes_dict = {}

# loop through the file data
# read the first line
headers = f.readline()

total_votes = 0
for line in f:
    line = line.rstrip() -----------------------------------------------------------------------------------------
# -----------------------------------------------------------------------------------------
## Option 2: PyPoll

fn = 'election_data_1.csv'
f = open(fn)

# create a dict
votes_dict = {}

# loop through the file data
# read the first line
headers = f.readline()

total_votes = 0
for line in f:
    line = line.rstrip()
    row_items = line.split(',')  # get ID, County, Candidate name
    candidate = row_items[2]
    if candidate in votes_dict:
        votes_dict[candidate] += 1
    else:
        votes_dict[candidate] = 1
    total_votes += 1
        
# output header
s = 'Election Results\n'
s += '-------------------------\n'

# The total number of votes cast
tot_votes_str = 'Total Votes: %d\n' % total_votes
s += tot_votes_str

# A complete list of candidates who received votes
# The percentage of votes each candidate won
# The total number of votes each candidate won

# output candidate results
max_votes = 0
leader = None
for candidate, vote_count in votes_dict.items():
    if vote_count > max_votes:
        max_votes = vote_count
        leader = candidate
    fraction_of_total = vote_count / total_votes
    percent_of_total = fraction_of_total * 100
    cand_str = '%s: %0.1f%% (%d)\n' % (candidate, percent_of_total, vote_count)
    s += cand_str
    
s += '-------------------------\n'
winner_str = 'Winner: %s\n' % leader
s += winner_str
s += '-------------------------\n'

print(s)
f.close()

# output results to a file
fn_root = fn[0:-4]
fn_out = fn_root + '_results.txt'
fout = open(fn_out, 'w')
fout.write(s)
fout.close()
    row_items = line.split(',')  # get ID, County, Candidate name
    candidate = row_items[2]
    if candidate in votes_dict:
        votes_dict[candidate] += 1
    else:
        votes_dict[candidate] = 1
    total_votes += 1
        
# output header
s = 'Election Results\n'
s += '-------------------------\n'

# The total number of votes cast
tot_votes_str = 'Total Votes: %d\n' % total_votes
s += tot_votes_str

# A complete list of candidates who received votes
# The percentage of votes each candidate won
# The total number of votes each candidate won

# output candidate results
max_votes = 0
leader = None
for candidate, vote_count in votes_dict.items():
    if vote_count > max_votes:
        max_votes = vote_count
        leader = candidate
    fraction_of_total = vote_count / total_votes
    percent_of_total = fraction_of_total * 100
    cand_str = '%s: %0.1f%% (%d)\n' % (candidate, percent_of_total, vote_count)
    s += cand_str
    
s += '-------------------------\n'
winner_str = 'Winner: %s\n' % leader
s += winner_str
s += '-------------------------\n'

print(s)
f.close()

# output results to a file
fn_root = fn[0:-4]
fn_out = fn_root + '_results.txt'
fout = open(fn_out, 'w')
fout.write(s)
fout.close()