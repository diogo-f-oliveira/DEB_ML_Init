function [data, auxData, metaData, txtData, weights] = mydata_Ilisha_megaloptera

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Pristigasteridae';
metaData.species    = 'Ilisha_megaloptera'; 
metaData.species_en = 'Bigeye ilisha'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCim'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L','L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 13];

%% set data
% zero-variate data
data.ab = 6;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on  Engraulis encrasicolus';
data.am = 2*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'BlabStau1998';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 10;      units.Lp = 'cm';   label.Lp = 'standard length at puberty';bibkey.Lp = 'BlabStau1998';
data.Li = 36.5;     units.Li = 'cm';   label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';

data.Wwb = 1.6e-3; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'BlabStau1998';
  comment.Wwb = 'based on egg diameter of 1.46 mm: pi/6*0.146^3';
data.Wwp = 12.7; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'BlabStau1998','fishbase'};
  comment.Wwp = 'based on 0.00832*(Lp/0.84)^2.96, see F1';
data.Wwi = 587; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00832*(Li/0.84)^2.96, see F1';
  
data.GSI = 0.09; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'BlabStau1998';
  temp.GSI = C2K(27); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), std length (cm)
87.692	4.119
120.000	5.648
124.615	8.345
126.923	6.001
136.154	6.823
143.077	9.637
152.308	9.991
173.077	8.003
175.385	10.112
177.692	12.339
184.615	12.458
191.538	11.991
196.154	12.812
205.385	12.345
212.308	13.518
216.923	12.699
219.231	13.988
219.232	12.230
223.846	14.106
228.462	15.279
228.463	15.865
228.464	13.052
249.231	15.400
249.232	14.697
249.233	13.642
258.462	17.394
263.077	17.864
265.385	15.638
295.386	19.159
323.077	20.337
390.000	20.232
410.769	21.526
426.923	21.997
440.769	21.649
466.154	23.177
473.077	23.881
528.462	23.189
579.231	24.137
602.308	25.430];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(27); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BlabStau1998';

% length-fecundity
data.LN = [ ... % std length (cm), weight (g)
15.972	8365.629
17.668	10060.554
17.875	8314.014
17.979	6815.744
18.671	14910.612
18.879	14080.739
19.052	17083.622
19.363	12838.812
19.536	10758.363
19.640	11343.426
20.228	15853.230
20.955	16948.674
21.163	19202.134
21.232	21203.288
21.336	18871.684
21.405	9039.504
21.405	22872.838
21.785	15212.515
22.824	11563.149
23.550	21991.927];
units.LN = {'cm', '#'};  label.LN = {'std length', 'fecundity'}; 
bibkey.LN = 'BlabStau1998';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 10 * weights.Li;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 3 * weights.Wwi;
weights.ab = 0 * weights.ab;
weights.GSI = 0 * weights.GSI;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'GSI is at odds with LN data, possibly due to water absorption by eggs';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00832*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.84 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3PG8D'; % Cat of Life
metaData.links.id_ITIS = '551315'; % ITIS
metaData.links.id_EoL = '46562732'; % Ency of Life
metaData.links.id_Wiki = 'Ilisha'; % Wikipedia
metaData.links.id_ADW = 'Ilisha_megaloptera'; % ADW
metaData.links.id_Taxo = '177496'; % Taxonomicon
metaData.links.id_WoRMS = '281166'; % WoRMS
metaData.links.id_fishbase = 'Ilisha-megaloptera'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ilisha}}';  
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
bibkey = 'BlabStau1998'; type = 'Article'; bib = [ ...  
'doi = {10.1006/ecss.1998.0376}, ' ...
'author = {S.J.M. Blaber and J. Staunton-Smith and D.A. Milton and G. Fry and T. Van der Velde and J. Pang and P. Wong and Ong Boon-Teck}, ' ...
'year = {1998}, ' ...
'title = {The Biology and Life-history Strategies of \emph{Ilisha} ({T}eleostei: {P}ristigasteridae) in the Coastal Waters and Estuaries of {S}arawak}, ' ... 
'journal = {Estuarine, Coastal and Shelf Science}, ' ...
'volume = {47(4)}, ' ...
'pages = {499–511}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Ilisha-megaloptera.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
