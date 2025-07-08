function [data, auxData, metaData, txtData, weights] = mydata_Apodemus_sylvaticus 
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Apodemus_sylvaticus'; 
metaData.species_en = 'Long-tailed field mouse'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl', 'xiHs', 'xiCi', 'xiF'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.7); % K, body temp 
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria in COMPLETE_data

metaData.author   = {'Elke Zimmer'};    
metaData.date_subm = [2018 04 17];              
metaData.email    = {'elke.zimmer@ibacon.com'};            
metaData.address  = {'Ibacon, Germany'};    

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 04 17]; 


%% set data
% zero-variate data
data.tg = 24;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'Wiki';   
  temp.tg = C2K(36.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'All data varies in between 21 and 26; but none of the papers seem reliable.';  
data.tx = 17;   units.tx = 'd';    label.tx = 'time since birth at weaning - lab'; bibkey.tx = 'GerlBart2001';  
  temp.tx = C2K(36.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 71;    units.tp = 'd';    label.tp = 'female sexual maturity';         bibkey.tp = 'geno';
  temp.tp = C2K(36.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 65;    units.tpm = 'd';    label.tpm = 'male sexual maturity';           bibkey.tpm = 'geno';
  temp.tpm = C2K(36.7);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 6.3 * 365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'geno';   
  temp.am = C2K(36.7);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Li  = 11;   units.Li  = 'cm';  label.Li  = 'ultimate length (head + torso) - field 3';   bibkey.Li  = 'kleins';

data.Ri  = 19.7 / 120;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'GerlBart2001';   
  temp.Ri = C2K(36.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% data.Wwb_f1 = 1.5;   units.Wwb_f1 = 'g';   label.Wwb_f1 = 'wet weight at birth';     bibkey.Wwb_f1 = 'geno';
data.Wwb = 2.5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth - animal div';     bibkey.Wwb = 'ADW';
data.Wwx = 8;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning wild';   bibkey.Wwx = 'poster';
% data.Wwx_lab = 16.3;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning lab';   bibkey.Wwx = 'GerlBart2001';
% comment.Wwx_lab = 'At 17 days, they are considered to be able to eat solid food and survive on their own --> maturity threshold and timing may not fit.'; 
% data.Wwp_female_f1 = 12;   units.Wwp_female_f1 = 'g';   label.Wwp_female_f1 = 'wet weight at puberty female poster';   bibkey.Wwp_female_f1 = 'poster';
data.Wwp = 14;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty female';   bibkey.Wwp = 'ADW';
data.Wwpm = 25;   units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty male';   bibkey.Wwpm = 'ADW';
data.Wwi = 44;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'kleins';

%% uni-variate data
% time-weight
% lab data
data.tW1 = [... 
0.94	2.44
1.96	4.37
2.97	5.37
3.95	7.45
4.93	9.24
5.95	11.25
6.93	11.96
7.86	13.32
8.92	14.11];  % weeks, g wet weight at f and T
data.tW1(:,1) = data.tW1(:,1) * 7;
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'lab'};  
  temp.tW1 = C2K(36.7);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'Flow1972';
auxData.W0.tW1 = 2.44;  units.W0.tW1 = 'g';  label.W0.tW1 = 'initial weight'; 
% field data
data.tW2 = [... 
5.95	13.11
6.93	13.04
7.90	14.11
7.94	15.11
8.76	13.25
8.76	14.33
8.92	12.03
8.88	12.89
8.84	16.12
8.88	17.12
8.88	17.83
8.72	18.26
9.04	18.26
9.08	13.25
9.04	14.33
9.94	12.18
9.90	13.11
9.90	14.11
9.78	15.04
9.98	15.11
9.78	16.12
10.02	16.04
9.94	17.12
9.90	17.98
9.90	22.20
10.92	14.11
10.92	15.04
10.92	15.83
10.79	16.33
11.00	16.26
10.92	17.12
10.92	17.83
10.79	18.26
11.08	18.34
10.92	19.12
10.92	20.06
10.92	21.13
10.92	22.13
11.93	13.11
11.89	16.12
11.77	20.84
11.77	21.27
11.81	22.20
11.98	20.91
12.02	21.49
12.02	22.20
12.91	15.11
12.91	18.12
12.91	19.12
12.75	21.20
13.03	21.27
13.89	18.26
13.93	19.12
13.93	20.20
13.89	23.28
13.85	25.21
14.95	22.20
14.87	24.14
14.87	25.21
15.89	20.20
16.90	20.13
16.86	23.21
17.88	22.28
18.90	20.27];  % g, wet weight at f and T
data.tW2(:,1) = data.tW2(:,1) - 4; % move the age a few weeks backwards
data.tW2(:,1) = data.tW2(:,1) * 7;
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight', 'field'};  
temp.tW2 = C2K(36.7);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'Flow1972';
comment.tW2 = 'Field animals were supplemented with food';
auxData.W0.tW2 = 13.11;  units.W0.tW2 = 'g';  label.W0.tW2 = 'initial weight'; 

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW1', 'tW2'}; subtitle1 = {'Flowerdew, lab', 'field'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed todiffer from females differ by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Males reach puberty earlier and are heavier at puberty. We could not find the max weight of males in the literature or the web';
metaData.bibkey.F1 = 'ADW'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'FRJJ'; % Cat of Life
metaData.links.id_ITIS = '585143'; % ITIS
metaData.links.id_EoL = '1178950'; % Ency of Life
metaData.links.id_Wiki = 'Apodemus_sylvaticus'; % Wikipedia
metaData.links.id_ADW = 'Apodemus_sylvaticus'; % ADW
metaData.links.id_Taxo = '167367'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13001221'; % MSW3
metaData.links.id_AnAge = 'Apodemus_sylvaticus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Apodemus_sylvaticus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'geno'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Apodemus_sylvaticus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Apodemus_sylvaticus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'kleins'; type = 'Misc'; bib = ...
'howpublished = {\url{http://kleinsaeuger.at/apodemus-sylvaticus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'poster'; type = 'misc'; bib = [ ... 
'author = {Mammal Society}, ' ... 
'howpublished = {Poster: Species Fact Sheet: Wood Mouse (Apodemus sylvaticus)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GerlBart2001'; type = 'Article'; bib = [ ...    
'author = {Gabriele Gerlach and Susann Bartmann}, ' ...
'year  = {2001}, ' ...
'title = {Reproductive skew, costs, and benefits of cooperative breeding in female wood mice (\emph{Apodemus sylvaticus})}, ' ...  
'journal = {Behavioral Ecology},'...
'volume = {13}, '...
'number = {3}, '...
'pages = {408--418}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Flow1972'; type = 'Article'; bib = [ ...    
'author = {Flowerdew, J. R.}, ' ...
'year  = {1972}, ' ...
'title = {The Effect of Supplementary Food on a Population of Wood Mice (\emph{Apodemus sylvaticus})}, ' ...  
'journal = {Journal of Animal Ecology},'...
'volume = {41}, '...
'number = {3}, '...
'pages = {553--566}'];
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


