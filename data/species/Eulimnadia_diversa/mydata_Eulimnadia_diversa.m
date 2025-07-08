function [data, auxData, metaData, txtData, weights] = mydata_Eulimnadia_diversa
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Spinicaudata'; 
metaData.family     = 'Limnadiidae';
metaData.species    = 'Eulimnadia_diversa'; 
metaData.species_en = 'Clam shrimp'; 

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'Hha'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 05]; 

%% set data
% zero-variate data

data.tp = 7;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Matt1937';
  temp.tp = C2K(26);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 15;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'Matt1937';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 0.34;  units.Lp = 'cm';  label.Lp  = 'carapace length at puberty'; bibkey.Lp  = 'Matt1937';
data.Li  = 0.78;  units.Li = 'cm';  label.Li  = 'ultimate carapace length';   bibkey.Li  = 'Matt1937';

data.Wwb  = 4.2e-6; units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';   bibkey.Wwb  = 'Matt1937';
  comment.Wwb = 'based on egg diameter of 200 mum: pi/6*200e-4^3';
data.Wwi  = 0.0459;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on foto length 0.78 cm, height 0.5 cm, thickness 0.15 cm: pi/4*0.78*0.5*0.15; uncertain because of water in carapace';

data.Ri  = 959;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(26);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Eulimnadia_texana';
 
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), growth increment (mm)
 1	0.213
 2	0.561
 3	1.005
 4	1.229
 5	1.722
 6	2.022
 7	2.601
 8	3.410
 9	4.238
10	4.548
11	4.657
12	4.698
14	4.714];
data.tL(:,1) = data.tL(:,1)-1; % set origin at birth
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'carapace length'};  
temp.tL = [ ...
    0 26
    1 26.5
    2 27
    3 19.5
    4 19
    5 17.5
    6 21
    7 30
    8 29.5]; 
units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Matt1937';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Reproduction data in tLR for last 5 data points are ignored; reduced reprod rate could be due to selective survival';   
metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'BJPLR'; % Cat of Life
metaData.links.id_ITIS = '83794'; % ITIS
metaData.links.id_EoL = '338854'; % Ency of Life
metaData.links.id_Wiki = 'Eulimnadia'; % Wikipedia
metaData.links.id_ADW = 'Eulimnadia_diversa'; % ADW
metaData.links.id_Taxo = '377941'; % Taxonomicon
metaData.links.id_WoRMS = '1598381'; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Matt1937'; type = 'Article'; bib = [ ... 
'doi = {10.2307/3222956}, ' ...
'author = {Norman T. Mattox}, ' ... 
'year = {1937}, ' ...
'title = {Studies on the Life History of a New Species of Fairy Shrimp, \emph{Eulimnadia diversa}}, ' ...
'journal = {Transactions of the American Microscopical Society}, ' ...
'volume = {56(2)}, ' ...
'pages = {249–255}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

