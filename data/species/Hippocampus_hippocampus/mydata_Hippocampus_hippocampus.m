function [data, auxData, metaData, txtData, weights] = mydata_Hippocampus_hippocampus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Syngnathidae';
metaData.species    = 'Hippocampus_hippocampus'; 
metaData.species_en = 'Short snouted seahorse'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MANE', 'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0iMcd', '0iMr'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp';  'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 06];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 06];

%% set data
% zero-variate data

data.ab = 22;      units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'CurtSant2017';   
  temp.ab = C2K(18.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 3.2*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'CurtSant2017';   
  temp.am = C2K(18.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 7.8;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';      bibkey.Lp  = 'CurtSant2017';
  comment.Lp = 'smallest male with a full brood pouch';
data.Li  = 15.2;  units.Li  = 'cm';  label.Li  = 'ultimate total length';        bibkey.Li  = 'CurtSant2017';

data.Wwb = 3.1e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.8 mm of H.kuda: pi/6*0.18^3';
data.Wwp = 1.23;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';       bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00282*Lp^2.96, see F2';
data.Wwi = 8.88;   units.Wwi = 'g';   label.Wwi = 'wet weight at puberty';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00282*Li^2.96, see F2';

data.Ri  = 509*3.6/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'CurtSant2017';   
  temp.Ri = C2K(18.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '509 eggs per spawn, 3.6 spawnings per yr';
 
% uni-variate data
% time-length data
data.tL = [ ... % time since birth (yr), std length (cm)
0.011	0.989
0.616	6.016
0.918	8.289
0.919	9.305
1.001	10.053
1.021	9.679
1.124	9.973
1.191	11.230
1.994	12.380
2.004	12.460
2.163	12.674
2.189	13.262
2.204	12.406
3.125	13.957];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(18.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CurtSant2017';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.00282*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3LZLW'; % Cat of Life
metaData.links.id_ITIS = '166497'; % ITIS
metaData.links.id_EoL = '46567767'; % Ency of Life
metaData.links.id_Wiki = 'Hippocampus_hippocampus'; % Wikipedia
metaData.links.id_ADW = 'Hippocampus_hippocampus'; % ADW
metaData.links.id_Taxo = '44856'; % Taxonomicon
metaData.links.id_WoRMS = '127380'; % WoRMS
metaData.links.id_fishbase = 'Hippocampus-hippocampus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hippocampus_hippocampus}}';
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
bibkey = 'CurtSant2017'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jfb.13473}, ' ...
'author = {Curtis, J. M. R. and Santos, S. V. and Nadeau, J. L. and Gunn, B. and Bigney Wilner, K. and Balasubramanian, H. and S. Overington and C.-M. Lesage and J. D''entremont and K. Wieckowski}, ' ... 
'year = {2017}, ' ...
'title = {Life history and ecology of the elusive {E}uropean short-snouted seahorse \emph{Hippocampus hippocampus}}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {91(6)}, ' ...
'pages = {1603–1622}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Hippocampus-hippocampus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

