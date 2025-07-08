function [data, auxData, metaData, txtData, weights] = mydata_Gymnoscopelus_braueri
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Gymnoscopelus_braueri'; 
metaData.species_en = 'Brauer''s lanternfish'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(0.8); % in K, body temp
metaData.data_0     = {'aj'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L';'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 31];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 31];

%% set data
% zero-variate data
data.am = 6*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'SaunLour2020';  
  temp.am = C2K(0.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 9.7;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'guess';
  comment.Lp = 'based on Electrona antarctica: 0.7*13.9 cm';
data.Li = 13.9;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'SaunLour2020';
  comment.Li = 'fishbase gives SL 22 cm';

data.Wwb = 6.5e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.5 mm of Benthosema_suborbitale: pi/6*0.05^3';
data.Wwp = 5.7; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'guess','fishbase'};  
  comment.Wwp = 'based on 0.00437*Lp^3.16, see F3';
data.Wwi = 17.9;  units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight'; bibkey.Wwi = {'SaunLour2020','fishbase'};     
  comment.Wwi = 'based on 0.00437*Li^3.16, see F3';

data.Ri  = 32e3/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';         bibkey.Ri  = 'guess';   
  temp.Ri = C2K(0.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Benthosema_suborbitale: 400*(13.9/3.2)^3';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), standard length (cm) 
0.981	4.347
1.014	4.721
1.047	4.084
1.112	4.759
1.488	4.909
1.537	5.396
2.061	7.532
2.061	4.759
2.077	8.543
2.093	10.042
2.093	7.944
2.093	6.595
2.093	5.920
2.093	4.347
2.110	7.644
2.110	6.857
2.208	7.382
2.224	8.131
2.241	5.995
2.241	7.007
2.257	5.021
2.257	5.696
2.257	6.258
2.257	6.670
2.453	7.044
2.470	7.719
2.486	5.883
2.502	6.820
2.502	6.482
2.519	6.745
3.042	8.543
3.058	7.382
3.058	7.681
3.058	8.131
3.075	7.007
3.075	9.630
3.091	6.070
3.206	11.691
3.206	9.480
3.222	6.632
3.238	9.180
3.238	8.768
3.238	8.656
3.238	8.543
3.238	8.431
3.238	7.944
3.238	6.857
3.255	8.956
3.255	8.131
3.255	7.044
3.271	8.244
3.435	7.232
3.435	7.532
3.451	6.183
3.451	11.241
3.467	7.944
3.467	8.806
3.467	8.993
3.467	9.143
3.467	10.117
3.484	8.393
3.484	8.731
3.484	9.593
3.484	9.780
3.484	9.855
3.500	5.433
3.516	9.405
3.516	10.567
3.533	11.653
4.023	9.255
4.089	10.604
4.089	9.555
4.089	8.768
4.089	8.169
4.220	12.590
4.220	9.255
4.236	8.656
4.236	8.506
4.252	11.653
4.252	10.192
4.269	10.941
4.269	8.993
4.269	8.169
4.269	7.756
4.318	9.780
4.465	8.693
4.465	9.855
4.465	10.679
4.481	7.344
4.498	9.555
4.498	10.454
4.498	11.653
4.498	11.953
4.498	12.178
5.054	12.328
5.054	11.054
5.054	9.967
5.054	9.105
5.054	8.244
5.070	10.342
5.086	11.878
5.103	13.977
5.103	12.815
5.103	9.518
5.201	11.766
5.234	12.403
5.234	11.016
5.234	8.806
5.250	9.930
5.250	9.293
5.250	8.431
5.266	10.417
5.283	8.506
5.479	10.604
5.495	10.042
5.495	10.342
6.068	11.279
6.100	11.578
6.100	10.192
6.509	10.904];
data.tL(:,1) = 365 * data.tL(:,1);
for i=2:size(data.tL,1);if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(0.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SaunLour2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5*weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Length-Weight relationship: W in g =  0.00437*(TL in cm)^3.16';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'TL-SL from photo: TL = 1.14*SL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6KVV2'; % Cat of Life
metaData.links.id_ITIS = '623816'; % ITIS
metaData.links.id_EoL = '46564286'; % Ency of Life
metaData.links.id_Wiki = 'Gymnoscopelus_braueri'; % Wikipedia
metaData.links.id_ADW = 'Gymnoscopelus_braueri'; % ADW
metaData.links.id_Taxo = '175592'; % Taxonomicon
metaData.links.id_WoRMS = '234642'; % WoRMS
metaData.links.id_fishbase = 'Gymnoscopelus-braueri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gymnoscopelus_braueri}}';
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
bibkey = 'SaunLour2020'; type = 'article'; bib = [ ...
'doi = {10.1111/jfb.14206}, ' ...
'author = {Ryan A. Saunders and Silvia Louren\c{c}o and Rui P. Vieira and Martin A. Collins and Carlos A. Assis and Jose C. Xavier}, ' ... 
'year   = {2020}, ' ...
'title  = {Age and growth of Brauer’s lanternfish Gymnoscopelus braueri and rhombic lanternfish \emph{Krefftichthys anderssoni} (Family {M}yctophidae) in the {S}cotia {S}ea, {S}outhern {O}cean}, ' ...
'journal = {J. Fish Biol.}, ' ...
'page = {21-27}, ' ...
'volume = {111}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Gymnoscopelus-braueri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

