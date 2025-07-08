function [data, auxData, metaData, txtData, weights] = mydata_Physa_fontinalis

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Physidae';
metaData.species    = 'Physa_fontinalis'; 
metaData.species_en = 'Common bladder snail'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl', '0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHa', 'biHl'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 25]; 

%% set data
% zero-variate data

data.ab = 13;  units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'Wit1955a';   
  temp.ab = C2K(14);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 230;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wit1955';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.07; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Wit1955';
data.Lp  = 0.42; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Wit1955a';
data.Li  = 1.20; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';

data.Wdi = 0.0447; units.Wdi = 'g';  label.Wdi = 'ultimate dry weight';    bibkey.Wdi = 'guess';
  comment.Wdi = 'based on size-corrected value for Lymnaea stagnalis, with extra correction for shape difference, excluding shell: 0.699*(1.2/3)^3';
 
data.Ri  = 190/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wit1955a';   
  temp.Ri = C2K(18);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ...
11.401	0.106
25.123	0.117
40.477	0.131
53.856	0.190
66.887	0.313
80.252	0.416
101.464	0.505
132.144	0.600
164.165	0.600
196.188	0.600
(196.188 + 166.855 -166.855)	0.600
(196.188 + 166.855 -99.229)	0.647
(196.188 + 166.855 -72.464)	0.744
(196.188 + 166.855 -59.087)	0.807
(196.188 + 166.855 -45.054)	0.866
(196.188 + 166.855 -30.698)	0.936];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Wit1955';
comment.tL = 'Data from Botshol, near Amsterdam';
  
% length - fecundity
data.LN = [ ... % shell height (cm), egg per capsule (#)
0.429	5.589
0.484	7.480
0.513	5.976
0.523	5.042
0.590	7.657
0.594	6.073
0.596	7.046
0.620	7.955
0.634	8.067
0.644	11.494
0.692	10.896
0.748	14.012
0.804	16.552
0.831	16.236
0.867	17.617
0.923	19.183
0.950	17.750
0.968	20.026];
units.LN   = {'cm', 'N'};  label.LN = {'shell length','eggs per capsule'};  
temp.LN    = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Wit1955a';
comment.LN = 'Data from Botshol, near Amsterdam';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.LN = 10 * weights.LN;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'Temperature in C for tL data varies as T(t) = 10+8*sin(2*pi*(t+20)/365))';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Simultaneous hermaprodite';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'No growth below T = 8 C';
metaData.bibkey.F2 = 'Wit1955'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4HF39'; % Cat of Life
metaData.links.id_ITIS = '76681'; % ITIS
metaData.links.id_EoL = '452885'; % Ency of Life
metaData.links.id_Wiki = 'Physa_fontinalis'; % Wikipedia
metaData.links.id_ADW = 'Physa_fontinalis'; % ADW
metaData.links.id_Taxo = '38513'; % Taxonomicon
metaData.links.id_WoRMS = '248248'; % WoRMS
metaData.links.id_molluscabase = '248248'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Physa_fontinalis}}';
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
bibkey = 'Wit1955'; type = 'Article'; bib = [ ... 
'author = {W.F. de Wit}, ' ... 
'year = {1955}, ' ...
'title = {The life cycle and some other biological details of the fresh-water snail \emph{Physa fontinalis} ({L}.)}, ' ...
'journal = {Basteria}, ' ...
'volume = {19(2/3)}, ' ...
'pages = {35-44}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wit1955a'; type = 'Article'; bib = [ ... 
'author = {W.F. de Wit}, ' ... 
'year = {1955}, ' ...
'title = {The life cycle and some other biological details of the fresh-water snail \emph{Physa fontinalis} ({L}.)}, ' ...
'journal = {Basteria}, ' ...
'volume = {19(4)}, ' ...
'pages = {45-76}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
