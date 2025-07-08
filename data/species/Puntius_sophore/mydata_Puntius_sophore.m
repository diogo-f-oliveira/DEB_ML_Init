
function [data, auxData, metaData, txtData, weights] = mydata_Puntius_sophore
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Puntius_sophore'; 
metaData.species_en = 'Pool barb'; 

metaData.ecoCode.climate = {'A','Cwa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFp', '0iFm', '0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biHl', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 09 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 23];

%% set data
% zero-variate data
data.am = 6*365;     units.am = 'd';  label.am = 'life span';  bibkey.am = 'Graa2003';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp = 5;    units.Lp = 'cm'; label.Lp = 'length at puberty for females'; bibkey.Lp = 'fishbase';
data.Li = 20;    units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';
  
data.Wwb = 2.6e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.7 mm of Capoeta: pi/6*0.17^3';
data.Wwi = 97;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01175*Li^3.01, see F1';

data.Ri = 23053/365; units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'fishbase';
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% univariate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
 0   	0.171
39.916	0.598
51.562	1.366
74.648	2.390
75.062	3.415
92.308	4.012
109.587	4.695
126.867	5.378
166.886	6.232
189.833	6.915
229.611	7.171
258.053	7.427
309.132	7.598
349.013	8.110
377.524	8.537
428.534	8.537
468.311	8.793
530.725	8.963
559.271	9.476
604.716	9.732
644.563	10.159
678.673	10.415
724.083	10.585
775.231	10.927
820.607	11.012
860.350	11.183
899.955	11.012
939.698	11.183
990.742	11.268
1041.855	11.524
1087.300	11.780
1149.679	11.866
1178.156	12.207
1223.567	12.378
1263.345	12.634
1319.987	12.549
1371.031	12.634
1405.037	12.634
1456.046	12.634
1512.689	12.549
1563.802	12.805
1620.548	12.976
1654.451	12.720
1705.494	12.805
1750.836	12.805
1779.209	12.890
1813.215	12.890
1847.222	12.890];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Graa2003';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'temperature (C) in tL data is assumed to vary as T(t)=20+10*sin(2*pi(t-t_0)/365)';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01175*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4QJ9K'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '60968467'; % Ency of Life
metaData.links.id_Wiki = 'Puntius_sophore'; % Wikipedia
metaData.links.id_ADW = 'Puntius_sophore'; % ADW
metaData.links.id_Taxo = '185623'; % Taxonomicon
metaData.links.id_WoRMS = '282518'; % WoRMS
metaData.links.id_fishbase = 'Puntius-sophore'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Puntius_sophore}}';  
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
bibkey = 'Graa2003'; type = 'article'; bib = [ ... 
'doi = {10.1046/j.1365-2400.2003.00341.x}, ' ...
'author = {G. de Graaf}, ' ...
'year = {2003}, ' ...
'title = {The ﬂood pulse and growth of ﬂoodplain ﬁsh in {B}angladesh}, ' ... 
'journal = {Fisheries Management and Ecology}, ' ...
'volume = {10}, '...
'pages = {241–247}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Puntius-sophore.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
