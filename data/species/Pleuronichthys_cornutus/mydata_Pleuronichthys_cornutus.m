function [data, auxData, metaData, txtData, weights] = mydata_Pleuronichthys_cornutus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Pleuronichthys_cornutus'; 
metaData.species_en = 'Ridged-eye flounder'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20.7); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 16];

%% set data
% zero-variate data
data.ab = 10;      units.ab = 'd';    label.ab = 'age at birth';                   bibkey.ab = 'guess';    
  temp.ab = C2K(20.7); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;     units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';  
  temp.am = C2K(20.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 12.7;  units.Lp = 'cm';   label.Lp = 'total length at puberty';          bibkey.Lp = 'DagaChan1992';
data.Li = 30;    units.Li = 'cm';   label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm of Microstomus kitt: pi/6*0.08^3';
data.Wwp = 30.3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = {'fishbase','DagaChan1992'};  
  comment.Wwp = 'based on 0.01479*Li^3.00, see F1';
data.Wwi = 399; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';      bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.01479*Li^3.00, see F1';

% uni-variate data
% time-length
data.tL_fm = [ ... % age (years) ~ Length (cm) 
 1   7.629  7.698
 2	12.165 11.134
 3	14.364 13.196
 4	15.533 14.227
 5	17.320 15.464
 6  17.732 17.113
 7  19.175 NaN
 8  19.725 NaN
 9  19.656 NaN];
data.tL_fm(:,1) = 365 * (0.7+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(20.7);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'DagaChan1992'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm = [ ... % age (years) ~ weight (g)
 1   36.486  32.359
 2	 57.863  54.415
 3	 87.484  78.549
 4	123.993 103.374
 5	136.429 121.297
 6  159.871 140.635
 7  183.298 NaN
 8  195.047 NaN
 9  199.938 NaN];
data.tW_fm(:,1) = 365 * (0.7+data.tW_fm(:,1)); % convert yr to d
units.tW_fm = {'d', 'g'}; label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(20.7);  units.temp.tW_fm = 'K'; label.temp.tL = 'temperature';
bibkey.tW_fm = 'DagaChan1992'; treat.tW_fm = {1 {'females','males'}};

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
12.889	18210.258
12.917	15704.553
12.973	12785.068
13.000	20739.328
13.028	17396.796
13.071	9872.575
13.486	26678.523
13.487	20820.907
13.502	11618.428
13.515	22917.550
13.516	13712.740
13.543	17483.037
13.557	21669.388
14.044	25516.545
14.056	37652.494
14.059	18824.489
14.070	36399.614
14.085	31799.539
14.085	28870.731
14.086	20502.748
14.087	17992.325
14.097	39333.083
14.138	46871.261
14.139	38921.691
14.140	30972.092
14.169	23445.541
14.418	38549.866
14.420	22232.284
14.434	24326.597
14.447	28094.563
14.462	20984.065
14.474	33956.785
14.486	53205.534
14.487	43582.339
14.489	26009.517
14.502	34798.273
14.504	22664.655
14.545	28947.649
14.557	40665.213
14.557	38573.175
14.822	36525.479
14.918	44909.806
14.919	41981.026
14.934	29849.739
14.948	35291.245
14.949	26504.876
14.959	54539.994
14.961	40314.422
14.962	31527.997
14.987	51615.847
14.989	35298.237
15.001	49526.196
15.044	39909.965
15.071	46609.042
15.460	53787.105
15.475	48350.233
15.476	39982.221
15.532	39573.160
15.541	76813.115
15.544	51709.080
15.546	37065.067
15.557	60916.221
15.571	58826.570
15.587	44603.273
15.588	34980.078
15.598	63433.637
15.600	53810.414
15.627	59254.279
15.643	42102.229
15.656	46706.937
15.669	53822.068
15.670	50056.461
16.031	59740.286
16.044	66437.004
16.045	53466.587
16.058	63510.554
16.074	48868.844
16.085	70209.603
16.089	41339.990
16.101	56823.132
16.102	43852.716
16.112	74816.670
16.118	33813.438
16.126	71890.192
16.129	50970.177
16.156	60179.649
16.169	63529.201
16.183	68552.322
16.185	48887.491
16.198	57257.833
16.623	102935.753
16.626	87454.942
16.630	58585.301
16.640	82018.069
16.641	79089.261
16.641	73650.058
16.642	72394.846
16.643	63608.450
16.656	68213.185
17.072	81253.499
17.073	76651.094
17.087	73724.645];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(20.7);  units.temp.LN = 'K'; label.temp.tL = 'temperature';
bibkey.LN = 'DagaChan1992'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.tW_fm = 5 * weights.tW_fm;
weights.ab = 0 * weights.ab;

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
D1 = 'males are assumed to differ from females by {p_Am} only ';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.01479*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4KBZF'; % Cat of Life
metaData.links.id_ITIS = '616046'; % ITIS
metaData.links.id_EoL = '46570167'; % Ency of Life
metaData.links.id_Wiki = 'Pleuronichthys_cornutus'; % Wikipedia
metaData.links.id_ADW = 'Pleuronichthys_cornutus'; % ADW
metaData.links.id_Taxo = '184151'; % Taxonomicon
metaData.links.id_WoRMS = '282291'; % WoRMS
metaData.links.id_fishbase = 'Pleuronichthys-cornutus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pleuronichthys_cornutus}}';
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
bibkey = 'DagaChan1992'; type = 'article'; bib = [ ...
'author = {Chen Dagang and Liu Changan and Dou Shuozeng}, ' ...
'year   = {1992}, ' ...
'title  = {THE BIOLOGY OF FLATFISH ({P}LEURONECTINAE) IN THE COASTAL WATERS OF {C}HINA}, ' ... 
'journal = {Netherlands Journal of Sea Research}, ' ...
'page = {215-221}, ' ...
'volume = {29(1-3)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pleuronichthys-cornutus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
