function [data, auxData, metaData, txtData, weights] = mydata_Clinocottus_analis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottidae';
metaData.species    = 'Clinocottus_analis'; 
metaData.species_en = 'Woolly sculpin'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 26];

%% set data
% zero-variate data

data.am = 8 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(17.9);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = '';
  
data.Lp  = 6;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'Well1986'; 
data.Li  = 18;     units.Li  = 'cm';  label.Li  = 'ultimate total length for';    bibkey.Li  = 'fishbase';

data.Wwb = 2.3e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.63 mm for Cottus volki: pi/6*0.163^3';
data.Wwi = 74; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.00776*Li^3.17, see F1'; 
 
% uni-variate data
% time-length
data.tL_fm = [ ... % age (years), total length (cm) 
0.154	1.690 NaN
0.234	3.120 NaN
0.336	3.640 NaN
0.411	3.512 NaN
0.513	3.958 NaN
0.552	4.867 NaN
0.673	4.554 NaN
0.788	5.279 NaN
0.871	6.374 NaN
0.948	6.041 NaN
0.991	6.283 NaN
    1   8.25  8.77
    2   8.65 10.13
    3   9.31 11.06
    4   9.48 11.25
    5   9.83 11.86
    6  10.00 14.55];
data.tL_fm(:,1) = 365 * (0.3 + data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(17.9);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Well1986'; treat.tL_fm = {1 {'females','males'}};

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
6.005	47.263
6.017	27.715
6.048	188.267
6.275	206.372
6.339	10.897
6.384	167.258
6.407	118.387
6.473	214.709
6.492	123.955
6.493	135.124
6.568	181.182
6.581	167.218
6.626	190.944
6.709	182.550
6.746	130.885
6.792	168.572
6.849	172.749
6.869	223.007
6.909	202.057
6.954	228.575
6.993	200.644
7.005	183.888
7.040	243.916
7.094	222.962
7.162	199.214
7.223	246.671
7.421	250.820
7.521	267.554
7.592	273.125
7.662	266.130
7.779	312.180
7.830	260.512
7.924	342.867
7.975	292.595
8.102	296.758
8.125	384.711
8.337	388.858
8.448	374.874
8.616	367.859
8.701	369.239
9.879	590.993
10.002	420.637
10.051	479.266
10.220	482.025
11.026	782.038];
units.LN = {'cm', '#'}; label.LN = {'total length','fecundity'};  
temp.LN = C2K(17.9);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Well1986'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 10;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00776*(TL in cm)^3.17';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'W6D6'; % Cat of Life
metaData.links.id_ITIS = '167227'; % ITIS
metaData.links.id_EoL = '46569086'; % Ency of Life
metaData.links.id_Wiki = 'Clinocottus_analis'; % Wikipedia
metaData.links.id_ADW = 'Clinocottus_analis'; % ADW
metaData.links.id_Taxo = '171440'; % Taxonomicon
metaData.links.id_WoRMS = '280219'; % WoRMS
metaData.links.id_fishbase = 'Clinocottus-analis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Clinocottus_analis}}';
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
bibkey = 'Well1986'; type = 'Article'; bib = [ ... 
'author = {Wells, A.W.}, ' ... 
'year = {1986}, ' ...
'title = {Aspects of the ecology and life history of the woolly sculpin, \emph{Clincottus analis} from southern {C}alifornia}, ' ...
'journal = {Calif. Fish Game}, ' ...
'volume = {72}, ' ...
'pages = {213-226}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Clinocottus-analis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

