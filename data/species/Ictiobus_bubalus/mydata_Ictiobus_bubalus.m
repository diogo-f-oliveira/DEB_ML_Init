  function [data, auxData, metaData, txtData, weights] = mydata_Ictiobus_bubalus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Ictiobus_bubalus'; 
metaData.species_en = 'Smallmouth buffalo'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 03]; 

%% set data
% zero-variate data
data.am = 15*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishbase';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 35;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'Jest1973'; 
data.Li = 112;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'Jest1973';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwi = 16.1e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';            bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01148*TL^3.00, see F1';

% univariate data

% time-length
data.tL = [ ... % year class (yr), fork length (inch)
0.022	0.633
0.935	8.552
1.039	7.707
1.908	13.092
1.928	11.825
1.928	12.459
2.965	16.893
2.965	17.315
2.987	18.582
4.913	28.190
4.975	27.345
4.976	27.873
5.929	32.941
5.949	32.097
5.991	31.780
6.964	36.320
6.985	35.897
7.005	35.264
7.998	38.854
8.040	38.431
8.970	41.599
8.970	41.599
8.990	40.121
9.920	44.027
9.962	43.499
10.024	42.443
10.869	44.872
10.931	43.394
10.932	44.344
11.903	46.772
11.924	46.139
11.944	44.977
12.980	50.045
13.040	46.456
13.949	48.884
13.972	51.418
14.961	49.834];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2) * 2.54/ 0.9; % convert FL in inch to TL in cm
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Jest1973';

% length - weight
data.LWw = [ ... total length (cm), wet weight (ounce)
9.958	1.510
20.068	5.663
30.034	16.276
40.451	32.763
50.583	64.225
60.729	111.543
70.889	177.655];
data.LWw(:,2) = data.LWw(:,2) * 28.35; % convert pound to g
units.LWw = {'cm', 'g'}; label.LWw = {'total length', 'wet weight'};  
bibkey.LWw = 'Jest1973';

% length - fecundity
data.LN = [ ... total length (cm), fecundity (#)
    44.9 104646
    47.2 133154
    47.8 174761
    51.0 236508
    52.6 269469
    49.9 149999
    61.4 427880];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Jest1973';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.01148 * (TL in cm)^3.00'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3PBC5'; % Cat of Life
metaData.links.id_ITIS = '163955'; % ITIS
metaData.links.id_EoL = '994837'; % Ency of Life
metaData.links.id_Wiki = 'Ictiobus_bubalus'; % Wikipedia
metaData.links.id_ADW = 'Ictiobus_bubalus'; % ADW
metaData.links.id_Taxo = '177457'; % Taxonomicon
metaData.links.id_WoRMS = '1022862'; % WoRMS
metaData.links.id_fishbase = 'Ictiobus-bubalus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ictiobus_bubalus}}';  
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
bibkey = 'Jest1973'; type = 'techreport'; bib = [ ...  
'author = {Douglas B. Jester}, ' ...
'year = {1973}, ' ...
'title = {Life history, ecology, and management of the smallmouth buffalo \emph{Ictiobus bubalus} ({R}afinesque) with reference to {E}lephant {B}utte {L}ake}, ' ... 
'sereis = {research report}, ' ...
'volue = {261}, ' ...
'insitution = {Agricultural Experiment Station}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Ictiobus-bubalus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

