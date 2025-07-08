function [data, auxData, metaData, txtData, weights] = mydata_Apodemus_agrarius

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Apodemus_agrarius'; 
metaData.species_en = 'Striped field mouse'; 

metaData.ecoCode.climate = {'Dfb', 'Dw'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTg', '0iFm'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 12 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 12 24]; 

%% set data
% zero-variate data

data.tg = 22;     units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 27;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 76;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 1220;    units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Balc2007';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1.9;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'AnAge';
data.Wwi = 40;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'Balc2007';

data.Ri  = 5.7*3.2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5.7 pups per litter; 3.2 litters peryr';
  
% univariate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
9.374	8.850
14.912	14.250
23.543	18.600
35.233	23.250
44.689	20.850
65.762	18.900
75.181	14.400
85.743	14.850
95.394	23.550
126.071	27.600
136.733	33.750
145.078	28.200
153.603	32.850
166.199	28.950
176.800	31.650
185.285	34.050
195.786	31.050
205.276	30.600
225.328	30.600
236.853	25.800
246.446	31.200
256.994	30.900
266.458	28.950
276.112	37.800
287.671	34.950
298.269	37.500
317.250	36.600
325.648	34.050
335.160	34.800
345.655	31.500
356.214	31.800
378.427	34.650
398.553	38.850
408.972	31.200
437.704	44.700
448.366	50.850
467.101	36.000
488.303	41.400
519.759	29.700
540.114	46.950
556.886	40.500
569.506	37.950
578.041	43.200
589.597	40.200
599.190	45.600
608.546	37.500
619.292	48.450
629.564	32.400
639.136	36.600
648.592	34.200
660.272	38.250
681.393	39.000
688.767	38.250
698.305	40.500
710.869	34.800
719.386	39.000
727.805	37.650
739.422	38.100
748.725	27.000
779.731	49.800
791.008	30.900
799.475	32.250
850.188	35.400
932.400	29.400
940.888	31.950
952.727	45.000
971.222	16.500
1002.012	27.000
1010.518	30.600
1023.212	32.250
1042.272	35.850
1054.954	36.900
1061.350	40.500
1073.735	24.600
1091.792	31.200
1102.380	33.150
1111.865	32.400
1123.614	40.350
1154.048	30.600
1162.675	41.100
1172.010	31.800
1183.535	27.000
1225.612	19.200
1233.949	13.200];units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW    = C2K(37.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Balc2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tW(end - 0:25) = 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 10 * weights.psd.v;
weights.psd.p_M = 10 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = 'FRHR'; % Cat of Life
metaData.links.id_ITIS = '585125'; % ITIS
metaData.links.id_EoL = '1178729'; % Ency of Life
metaData.links.id_Wiki = 'Apodemus_agrarius'; % Wikipedia
metaData.links.id_ADW = 'Apodemus_agrarius'; % ADW
metaData.links.id_Taxo = '62911'; % Taxonomicon
metaData.links.id_WoRMS = '1506688'; % WoRMS
metaData.links.id_MSW3 = '13001204'; % MSW3
metaData.links.id_AnAge = 'Apodemus_agrarius'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Apodemus_agrarius}}';
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
bibkey = 'Balc2007'; type = 'Article'; bib = [ ... 
'author = {L. Balciauskiene}, ' ... 
'year = {2007}, ' ...
'title = {The growth of captive bred field mice (\emph{Apodemus agrarius})}, ' ...
'journal = {Acta Zoolofica Lituanica}, ' ...
'volume = {17}, ' ...
'number = {4}, ' ...
'pages = {313--322}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Apodemus_agrarius}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

