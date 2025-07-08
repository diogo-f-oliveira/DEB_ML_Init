function [data, auxData, metaData, txtData, weights] = mydata_Merluccius_albidus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Merlucciidae';
metaData.species    = 'Merluccius_albidus'; 
metaData.species_en = 'Offshore silver hake'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jpCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12.6); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 22];

%% set data
% zero-variate data
data.am = 20*365;     units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';  
  temp.am = C2K(12.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 28;     units.Lp = 'cm';   label.Lp = 'total length at puberty for females';  bibkey.Lp = 'fishbase';
data.Li = 40.6;    units.Li = 'cm';   label.Li = 'ultimate total length';       bibkey.Li = 'fishbase';

data.Wwb = 7e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.1 mum: pi/6*0.11^3';
data.Wwp = 172;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on Wwp = 0.00759*Lp^3.01, see F1';
data.Wwi = 527;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on Wwi = 0.00759*Li^3.01, see F1';
  
data.Ri  = 34e4/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'fishbase';  
  temp.Ri = C2K(12.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length 
data.tL = [ ... % time since birth (yr), total length (cm) 
1.130	14.480
1.261	12.783
1.269	19.457
1.688	24.887
1.698	27.036
1.709	23.077
1.710	20.928
1.730	22.285
2.088	30.995
2.101	24.548
2.109	28.167
2.110	25.566
2.112	22.059
2.121	23.643
2.129	29.751
2.231	25.226
2.253	21.154
2.691	32.240
2.699	36.086
2.701	30.995
2.720	34.276
3.061	35.068
3.235	28.733
3.245	27.489
3.251	38.462
3.253	32.014
3.254	30.543
3.265	29.186
3.664	36.199
3.666	30.769
3.685	34.615
3.691	44.457
3.704	37.443
4.054	41.290
4.077	34.615
4.085	39.027
4.086	36.199
4.108	30.204
4.117	33.145
4.227	36.199
4.238	32.127
4.239	30.882
4.246	38.122
4.255	41.176
4.256	39.140
5.087	45.249];
data.tL(:,1) = (0+data.tL(:,1))*365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(12.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'TravAlad2012'; 
%
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    0 11.8 11.8
    1 22.9 24.0
    2 34.1 29.6
    3 40.6 32.9
    4 45.1 NaN
    5 49.5 NaN];
data.tL_fm(:,1) = (0.8+data.tL_fm(:,1))*365; % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(12.6);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'RohrGuth1977'; treat.tL_fm = {1, {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00759*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3ZV6G'; % Cat of Life
metaData.links.id_ITIS = '164793'; % ITIS
metaData.links.id_EoL = '46564941'; % Ency of Life
metaData.links.id_Wiki = 'Merluccius_albidus'; % Wikipedia
metaData.links.id_ADW = 'Merluccius_albidus'; % ADW
metaData.links.id_Taxo = '179865'; % Taxonomicon
metaData.links.id_WoRMS = '158748'; % WoRMS
metaData.links.id_fishbase = 'Merluccius-albidus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Merluccius_albidus}}';
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
bibkey = 'TravAlad2012'; type = 'article'; bib = [ ... 
'doi = {10.1016/j.fishres.2011.08.004}, ' ...
'author = {Traver, M. L. and Alade, L. and Sosebee, K. A.}, ' ... 
'year = {2012}, ' ...
'title = {Population biology of a data poor species, offshore hake (Merluccius albidus) in the northwest Atlantic, United States}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {114}, ' ...
'pages = {42–51}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RohrGuth1977'; type = 'article'; bib = [ ... 
'author = {Bennie A. Rohr and Elmer J. Gutherz}, ' ... 
'year = {1977}, ' ...
'title = {BIOLOGY OF OFFSHORE HAKE, \emph{Merluccius albidus}, IN THE {G}ULF OF {M}EXICO}, ' ...
'journal = {Fishery Bulletin}, ' ...
'volume = {75(1)}, ' ...
'pages = {147-158}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Merluccius-albidus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

