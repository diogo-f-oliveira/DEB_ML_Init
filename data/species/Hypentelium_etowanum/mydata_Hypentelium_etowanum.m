  function [data, auxData, metaData, txtData, weights] = mydata_Hypentelium_etowanum
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Hypentelium_etowanum'; 
metaData.species_en = 'Alabama hog sucker'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-tWw'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 28]; 

%% set data
% zero-variate data
data.am = 1550;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'OKelPowe2007';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 14.15;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'OKelPowe2007'; 
  comment.Lp = 'based on SL 12.45 cm';
data.Li = 26.1;    units.Li = 'cm'; label.Li = 'ultimate total length';              bibkey.Li = 'fishbase';
  comment.Li = 'although fisbase gives TL 23 cm, tL data suggest that this should be SL';

data.Wwb = 1.15e-2;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';              bibkey.Wwb = {'OKelPowe2007','fishbase'};
  comment.Wwb = 'based on egg diameter of 2.8 mm of Erimyzon oblongus: pi/6*0.28^3';

data.Ri  = 2717/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'OKelPowe2007';   
  temp.Ri = C2K(13);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
90.782	4.454
129.191	4.789
156.877	4.863
188.628	4.337
216.314	4.411
250.504	4.859
282.327	4.558
307.909	4.707
335.739	5.230
368.255	7.101
400.352	7.662
434.315	7.398
461.475	5.824
522.095	9.080
551.814	8.854
622.452	10.162
647.796	9.562
684.125	10.047
707.663	10.458
740.036	11.880
765.977	13.153
799.772	12.365
833.818	12.363
865.856	12.736
893.482	12.623
921.121	12.547
1044.860	13.553
1081.142	13.889
1102.504	14.150
1138.989	15.122
1162.276	14.747
1287.773	14.592
1446.563	18.743
1595.539	18.811];
data.tL(:,1) = 0 + data.tL(:,1);  % set origin to birth
data.tL(:,2) = data.tL(:,2)/0.88;  % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(13);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'OKelPowe2007'; 


% time- weight  
data.tWw = [ ... % time since birth (yr), get weight (g)
90.700	1.530
118.139	1.524
145.563	1.961
183.580	1.286
213.138	1.057
242.665	1.715
272.239	1.043
301.766	1.701
331.309	1.915
356.521	5.237
396.563	7.001
421.907	6.552
455.819	2.551
518.814	11.852
550.436	12.953
609.397	16.931
639.017	14.928
666.332	18.470
691.661	18.464
729.241	30.211
766.946	38.409
788.404	28.422
822.106	30.410
853.666	33.286
885.444	29.951
914.924	31.940
1032.962	36.570
1066.344	47.652
1093.690	50.307
1129.221	60.280
1159.013	53.397
1273.142	49.155
1434.187	91.260
1581.463	104.755];
data.tWw(:,1) = 0 + data.tWw(:,1);  % set origin to birth
units.tWw = {'d', 'g'}; label.tWw = {'time since birth', 'wet weight'};  
temp.tWw = C2K(13);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'OKelPowe2007';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.tWw = 3 * weights.tWw;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: W in g = 0.00202*(TL in cm)^3.10, but this is inconsistent with tL vs tWW data';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length: SL = 0.88 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3NNDT'; % Cat of Life
metaData.links.id_ITIS = '163950'; % ITIS
metaData.links.id_EoL = '994833'; % Ency of Life
metaData.links.id_Wiki = 'Hypentelium_etowanum'; % Wikipedia
metaData.links.id_ADW = 'Hypentelium_etowanum'; % ADW
metaData.links.id_Taxo = '177009'; % Taxonomicon
metaData.links.id_WoRMS = '1214760'; % WoRMS
metaData.links.id_fishbase = 'Hypentelium-etowanum'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Hypentelium_etowanum}}';  
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
bibkey = 'OKelPowe2007'; type = 'Article'; bib = [ ... 
'author = {Christopher T. O''Kelley and Steven L. Powers}, ' ...
'year = {2007}, ' ...
'title = {Life-History Aspects of \emph{Hypentelium etowanum} ({A}labama Hog Sucker) ({A}ctinopterygii: {C}atostomidae) in {N}orthern {G}eorgia}, ' ... 
'journal = {Southeastern Naturalist}, ' ...
'volume = {6(3)}, '...
'pages = {479-490}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Hypentelium-etowanum.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

