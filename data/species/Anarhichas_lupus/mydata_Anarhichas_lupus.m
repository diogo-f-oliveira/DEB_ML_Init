function [data, auxData, metaData, txtData, weights] = mydata_Anarhichas_lupus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Anarhichadidae';
metaData.species    = 'Anarhichas_lupus'; 
metaData.species_en = 'Atlantic wolffish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0bMb', 'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'R_L'}; 
metaData.data_1     = {'t-L'; 'T-ab'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 09 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 09 09]; 


%% set data
% zero-variate data

data.ab = 174;     units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'PavlMoks1995';   
  temp.ab = C2K(5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 6.8*365; units.ap = 'd';    label.ap = 'age at puberty';          bibkey.ap = 'NelsRoss1992';
  temp.ap = C2K(5);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'time at 47 cm';
  
data.am = 60*365;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

%data.L0  = 0.575;  units.L0  = 'cm';  label.Lb  = 'egg diameter';           bibkey.L0  = 'Wiki';  
data.Lb  = 3.9;    units.Lb  = 'cm';  label.Lb  = 'total length at birth';  bibkey.Lb  = 'NelsRoss1992';  
data.Lp  = 47;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'NelsRoss1992'; 
data.Li  = 150;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'Wiki';

data.Wwi = 18000;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Fishbase: 23.6 kg';

data.R125  = 12740/365; units.R125  = '#/d'; label.R125  = 'reprod rate at 125 cm'; bibkey.R125  = 'fishbase';   
temp.R125 = C2K(5);  units.temp.R125 = 'K'; label.temp.R125 = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ...
0       	3.902e+000
9.833e-001	1.034e+001
1.504e+000	1.483e+001
2.051e+000	1.366e+001
2.572e+000	1.756e+001
3.582e+000	2.283e+001
4.103e+000	3.024e+001
4.622e+000	2.946e+001
5.115e+000	3.668e+001
5.606e+000	4.020e+001
6.098e+000	4.624e+001
6.587e+000	4.000e+001
7.082e+000	6.068e+001
7.543e+000	5.990e+001
8.035e+000	6.595e+001
8.613e+000	6.849e+001
9.075e+000	7.122e+001
9.597e+000	8.312e+001
1.009e+001	7.532e+001
1.055e+001	7.902e+001
1.107e+001	8.371e+001
1.205e+001	8.956e+001
1.312e+001	8.585e+001
1.352e+001	7.395e+001
1.407e+001	8.468e+001
1.508e+001	9.190e+001
1.609e+001	1.001e+002
1.710e+001	9.073e+001
1.805e+001	8.839e+001
1.901e+001	1.071e+002
2.105e+001	9.834e+001
2.203e+001	9.795e+001];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'NelsRoss1992';
comment.tL = 'data at T = 5 C (spring) till 7.3 (autumn, <47 cm) or 4.6 till 7.8 (> 47 cm) ';
  
% T-ab data from PavlMoks1995
data.Tab = [ ... % temp (C), time at hatching (d)
2.992	248.574
5.014	174.252
7.017	132.540
8.983	108.765
10.986	90.694
12.989	81.590];
units.Tab = {'C', 'd'};     label.Tab = {'temperature', 'age at hatch'};  
bibkey.Tab = 'PavlMoks1995';

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

%% Facts
F1 = 'Immatures live in shallower and warmer waters. No difference in growth between sexes. Food: mostly scalops, echinoids';
metaData.bibkey.F1 = 'NelsRoss1992'; 
F2 = 'Natural antifreeze keeps their blood moving fluidly in their very cold habitat. internal fertilization; male stays with nest and protects the eggs for 4 months, until the brood is independence.';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'DGB7'; % Cat of Life
metaData.links.id_ITIS = '171341'; % ITIS
metaData.links.id_EoL = '46574577'; % Ency of Life
metaData.links.id_Wiki = 'Anarhichas_lupus'; % Wikipedia
metaData.links.id_ADW = 'Anarhichas_lupus'; % ADW
metaData.links.id_Taxo = '46468'; % Taxonomicon
metaData.links.id_WoRMS = '126758'; % WoRMS
metaData.links.id_fishbase = 'Anarhichas-lupus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anarhichas_lupus}}';
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
bibkey = 'NelsRoss1992'; type = 'Article'; bib = [ ... 
'author = {Nelson, G. A. and Ross, M. R.}, ' ... 
'howpublished = {\url{http://journal.nafo.int/j13/nelson.pdf}}, ' ...
'year = {1992}, ' ...
'title = {Distribution, Growth and Food Habits of the {A}tlantic Wolffish (\emph{Anarhichas lupus}) from the {G}ulf of {M}aine-{G}eorges {B}ank Region.}, ' ...
'journal = {J. Northw. Atl. Fish. Sci.}, ' ...
'volume = {13}, ' ...
'pages = {53-61}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PavlMoks1995'; type = 'Article'; bib = [ ... 
'author = {Pavlov, D. A. and Moksness, E.}, ' ... 
'year = {1995}, ' ...
'title = {Development of wolffish eggs at different temperature regimes}, ' ...
'journal = {Aquaculture Internat}, ' ...
'volume = {3}, ' ...
'pages = {315--335}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/2501}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

