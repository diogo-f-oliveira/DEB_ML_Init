  function [data, auxData, metaData, txtData, weights] = mydata_Cichla_orinocensis
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Cichla_orinocensis'; 
metaData.species_en = 'Peacock cichlid'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 16];

%% set data
% zero-variate data
data.ab = 2.5+5.6; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'JepsWine1999';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'yolk sace absorption 5-6 d after hatch'; 
data.am = 8*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'JepsWine1999';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 28;     units.Lp = 'cm';   label.Lp = 'total length at puberty for females';bibkey.Lp = 'fishbase';
data.Li = 61.7;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 4.2e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2 mm of Gymnogeophagus_lacustris: pi/6*0.2^3';
data.Wwp = 323;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01288*Lip^3.04, see F1';
data.Wwi = 3568;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01288*Li^3.04, see F1; max published weight 6.2 kg';

data.Ri = 1e5/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'guess';
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
0.000	28.366
0.001	25.105
0.002	21.681
0.003	18.909
0.0004	15.812
0.018	19.887
0.036	24.452
0.037	21.191
0.038	18.420
0.054	23.474
0.987	21.824
0.988	31.770
1.004	25.574
1.022	24.269
1.023	27.204
1.040	29.160
1.058	20.355
2.003	34.031
2.004	31.912
2.005	29.792
2.006	28.651
2.007	27.347
2.008	26.695
2.009	24.412
2.063	23.596
2.960	29.447
2.996	35.805
2.997	36.620
3.013	31.565
3.031	32.380
4.000	37.741
4.018	36.925
4.036	32.034
4.037	31.545
4.072	34.968
4.987	34.623
4.988	44.732
5.022	37.394
6.009	41.939
6.045	35.091
6.978	43.224
7.013	44.364];
data.tL(:,1) = (data.tL(:,1) + 1.5) * 365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'std length'};  
  temp.tL = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'JepsWine1999';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = weights.psd.v * 10;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01288*(TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'V7QW'; % Cat of Life
metaData.links.id_ITIS = '648359'; % ITIS
metaData.links.id_EoL = '214312'; % Ency of Life
metaData.links.id_Wiki = 'Cichla_orinocensis'; % Wikipedia
metaData.links.id_ADW = 'Cichla_orinocensis'; % ADW
metaData.links.id_Taxo = '171190'; % Taxonomicon
metaData.links.id_WoRMS = '1022807'; % WoRMS
metaData.links.id_fishbase = 'Cichla-orinocensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Cichla_orinocensis}}';  
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
bibkey = 'JepsWine1999'; type = 'Article'; bib = [ ...
'author = {D. B. Jepsen and K. O. Winemiller and D. C. Taphorn and D. Rodriguez Olarte}, ' ...
'year = {1999}, ' ...
'title = {Age structure and growth of peacock cichlids from rivers and reservoirs of {V}enezuela}, ' ... 
'journal = {Journal of Fish Biology}, ' ...
'volume = {55}, '...
'pages = {433±-450}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cichla-orinocensis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

