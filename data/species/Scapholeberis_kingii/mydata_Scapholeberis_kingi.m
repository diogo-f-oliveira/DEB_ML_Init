function [data, auxData, metaData, txtData, weights] = mydata_Scapholeberis_armata

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Daphniidae';
metaData.species    = 'Scapholeberis_armata'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'THn','TN'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Tbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 't-R'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 12]; 

%% set data
% zero-variate data

data.ab = 1.9;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'CastWisn2012';   
  temp.ab = C2K(23);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 5.86;    units.tp = 'd';    label.tp = 'time since birth at at puberty'; bibkey.tp = 'CastWisn2012';   
  temp.tp = C2K(23);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 31;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'CastWisn2012';   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.0281; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb = 'CastWisn2012';
data.Lp  = 0.0400; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp = 'CastWisn2012';
data.Li  = 0.0914; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li = 'CastWisn2012';

data.Wdi  = 5.4e-6;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi = 'guess';
  comment.Wdi = 'based on length-weight of Ceriodaphnia dubia: (0.0914/0.09832)^3*6.71e-06'; 
  
% uni-variate data
% time-length-reprod
data.tLR = [ ... % time since birth (d), length (mm)
 0	0.280  0
 1	0.299  0
 2	0.351  0
 3	0.432  0
 4	0.498  0
 5	0.534  3.968
 6	0.579  3.174
 7	0.614  5.965
 8	0.643  5.376
 9	0.667  5.478
10	0.692  8.192
11	0.712  9.958
12	0.731 10.573
13	0.742 10.010
14	0.761 10.342
15	0.769 12.109
16	0.791 10.752
17	0.794 10.138
18	0.809 11.981
19	0.822 11.853
20	0.826 10.624
21	0.847 11.981
22	0.847 11.955
23	0.872 13.005
24	0.872  8.294
25	0.909  7.014
26	0.914  0
27	0.903  0
28	0.902  0];
data.tLR(:,2) = data.tLR(:,2)/ 10; % convert mm to cm
data.tLR(:,3) = cumsum(data.tLR(:,3));
units.tLR  = {'d', 'cm', '#'};  label.tLR = {'time since birth', 'length', 'cumulative # of eggs'};  
temp.tLR   = C2K(23); units.temp.tLR = 'K'; label.temp.tLR = 'temperature';
bibkey.tLR = 'CastWisn2012'; treat.tLR = {1 {'length','cum reprod'}};
  
%% set weights for all real data
weights = setweights(data, []);
weights.tLR = 10 * weights.tLR; weights.tLR(end-5:end,2) = 0;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {}; subtitle1 = {};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'ab is ignored in estimation because of inconsistency with tL data; a delay in the onset of development might be present';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = '';
metaData.bibkey.F1 = ''; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6Y73F'; % Cat of Life
metaData.links.id_ITIS = '83928'; % ITIS
metaData.links.id_EoL = '327090'; % Ency of Life
metaData.links.id_Wiki = 'Scapholeberis'; % Wikipedia
metaData.links.id_ADW = 'Scapholeberis_armata'; % ADW
metaData.links.id_Taxo = '572817'; % Taxonomicon
metaData.links.id_WoRMS = '1302909'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Scapholeberis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CastWisn2012'; type = 'Article'; bib = [ ... 
'author = {Maria Carolina de Almeida Castilho and C\''{e}lio Wisniewski and Maria Jos\''{e} dos Santos-Wisniewski}, ' ... 
'year = {2012}, ' ...
'title = {Life cycle of \emph{Scapholeberis armata freyi} {D}umont \& {P}ensaert, 1983 ({C}ladocera, {D}aphnidae)}, ' ...
'journal = {Biota Neotrop.}, ' ...
'volume = {12(4)}, ' ...
'pages = {589--603}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
