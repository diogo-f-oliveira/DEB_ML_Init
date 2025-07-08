  function [data, auxData, metaData, txtData, weights] = mydata_Agosia_chrysogaster
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Agosia_chrysogaster'; 
metaData.species_en = 'Longfin dace'; 

metaData.ecoCode.climate = {'BWh','BSh','BSk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFr', 'jpFc'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biHa','biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 09 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 13]; 

%% set data
% zero-variate data
data.am = 1.5*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'Wint1962';   
  temp.am = C2K(13);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.2;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'Kepn1982';
  comment.Lp = 'based on SL 3.6 cm, see F2';
data.Li = 10;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 7e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Kepn1982';
  comment.Wwb = 'based on egg diameter of 1.1 mm: pi/6*0.11^3';
data.Wwp = 0.73;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','Wint1962'};
  comment.Wwp = 'based on 0.00813*Lp^3.13, see F1';
data.Wwi = 11;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00813*Li^3.13, see F1';

  
% uni-variate data
data.tL = [ ... % number of circuli (d), std length (cm)
0.175	2.427
0.253	2.186
0.278	1.863
0.420	1.881
3.054	2.983
3.122	2.586
3.136	2.799
4.068	2.796
4.141	3.212
4.174	2.990
5.074	3.210
5.180	3.413
5.192	3.607
5.205	3.800
6.051	3.189
6.071	4.214
6.150	4.001
6.183	3.789
6.300	3.438
6.981	4.591
7.014	4.387
7.130	4.008
7.150	3.602
7.235	4.193
8.112	4.782
8.150	5.373
8.179	4.375
8.212	4.163
9.981	5.572
9.989	4.972
10.142	5.184
11.086	5.357
11.099	5.560
11.121	5.172
11.153	4.950
12.094	5.807
12.105	5.983
13.064	6.387
13.073	5.805
13.144	6.193
14.057	6.606
14.089	6.384
14.122	6.172
15.118	7.158
16.187	6.389];
data.tL(:,1) = (5+data.tL(:,1))*365/20; % converty circuli to d
data.tL(:,2) = data.tL(:,2)/0.85; % convert SL to TL
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(13);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = {'Wint1962'};
comment.tL = 'uncertainly converted from circuli';

% length - fecundity
data.LN = [ ... % standard length (cm), fecundity (#)
4.223	103.596
4.271	2.444
4.277	10.342
4.316	5.582
4.374	24.515
4.399	0.801
4.662	44.915
4.766	92.268
4.837	300.810
4.862	261.295
4.909	175.944
4.929	17.921
5.105	289.617
5.165	3.583
5.339	44.580
5.445	309.991
5.488	104.552
5.575	207.218
5.599	1.788
5.632	204.029
5.641	265.650
5.644	0.186
5.683	6.488
5.695	170.816
5.713	129.723
5.716	52.295
5.779	33.302
5.791	3.274
5.899	0.060
5.917	298.697
5.976	0.022
5.996	14.234
6.043	93.217
6.057	293.887
6.125	230.648
6.332	289.011
6.379	2.984
6.456	555.993
6.645	664.929
7.086	650.490];
data.LN(:,1) = data.LN(:,1)/0.85; % convert SL to TL
units.LN = {'cm', '#'};  label.LN = {'total length','fecundity'};  
  temp.LN = C2K(13);  units.temp.LN = 'K'; label.temp.LN = 'temperature'; 
bibkey.LN = {'Kepn1982'};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.LN = weights.LN .* (data.LN(:,2) > 30);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = weights.psd.v * 2;
%weights.psd.p_M = weights.psd.p_M * 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to to differ from females';
D2 = 'mean temperatures are guessed';
D3 = 'fish with less than 30 eggs were ignored in LN data';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g = 0.00813*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.85*TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '65SKT'; % Cat of Life
metaData.links.id_ITIS = '163533'; % ITIS
metaData.links.id_EoL = '610817'; % Ency of Life
metaData.links.id_Wiki = 'Agosia_chrysogaster'; % Wikipedia
metaData.links.id_ADW = 'Agosia_chrysogaster'; % ADW
metaData.links.id_Taxo = '239207'; % Taxonomicon
metaData.links.id_WoRMS = '1021385'; % WoRMS
metaData.links.id_fishbase = 'Agosia-chrysogaster'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Agosia_chrysogaster}}';  
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Agosia-chrysogaster.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Cobu1986'; type = 'Article'; bib = [ ... 
'author = {Coburn, Miles M.}, ' ... 
'year = {1986}, ' ...
'title = {Egg Diameter Variation in {E}astern {N}orth {A}merican {M}innows ({P}isces: {C}yprinidae): {C}orrelation with Vertebral Number, Habitat and Spawning Behavior}, ' ...
'journal = {The Ohio Journal of Science}, ' ...
'volume = {86(1)}, ' ...
'pages = {110-120}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wint1962'; type = 'phdthesis'; bib = [ ... 
'author = {Winther, John Kristian}, ' ... 
'year = {1962}, ' ...
'title = {Age and Growth of the Longfin Dace, \emph{Agosia chrysogaster} Girard}, ' ...
'school = {University of New Mexico}, ' ...
'howpublished = {\url{https://digitalrepository.unm.edu/biol_etds/268}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kepn1982'; type = 'phdthesis'; bib = [ ... 
'author = {William G. Kepner}, ' ... 
'year = {1982}, ' ...
'title = {Reproductive Biology of the Longfin Dace (\emph{Agosia chrysogaster}) a Sonoran Desert stream, Arizona}, ' ...
'school = {Arizona State University}, ' ...
'howpublished = {\url{https://digitalrepository.unm.edu/biol_etds/268}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  