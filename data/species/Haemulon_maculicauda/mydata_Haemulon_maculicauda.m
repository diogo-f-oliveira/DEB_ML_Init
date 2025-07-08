function [data, auxData, metaData, txtData, weights] = mydata_Haemulon_maculicauda
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Haemulidae';
metaData.species    = 'Haemulon_maculicauda'; 
metaData.species_en = 'Spottail grunt'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2025 02 18]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 18];

%% set data
% zero-variate data

data.am = 20*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'CruzEspi1993';   
  temp.am = C2K(27.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 15; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 30;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of Lutjanus stellatus: pi/6*0.085^3'; 
data.Wwp = 120;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = {'guess','CruzEspi1993'};
  comment.Wwp = 'based on 0.01380*Lp^3.03, see F1';
data.Wwi = 600; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max. published weight: 557 g; based on 0.01380*Li^3.03 gives 290.5 g, see F1';

data.Ri  = 4.4e5/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Haemulon_album: 2.2e6*1181/5926';
  
% uni-variate data
% time-length
data.tL = [ ... % time (D), total length (cm)
    1  3.04
    2  6.58
    3  9.04
    4 11.89
    5 14.09
    6 16.03
    7 17.76
    8 19.28
    9 20.62
   10 21.81
   11 22.87
   12 23.08
   13 24.62
   14 25.35
   15 25.99
   16 26.56
   17 27.06
   18 27.51
   19 27.09
   20 28.25];
data.tL(:,1) = (data.tL(:,1) + 0)*365;  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CruzEspi1993';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
11.463	61.618
11.487	49.939
11.975	68.311
12.395	69.773
12.467	49.022
13.022	99.888
13.026	50.539
13.163	79.164
13.349	84.431
13.445	53.299
13.557	103.992
13.606	76.739
13.768	96.282
13.935	53.490
14.045	121.066
14.118	91.224
14.163	112.021
14.166	78.255
14.325	121.175
14.327	101.695
14.377	58.857
14.415	154.976
14.676	103.130
14.721	129.121
14.905	156.465
14.960	60.383
15.140	129.284
15.211	116.325
15.214	87.755
15.232	143.606
15.305	105.972
15.395	143.670
15.417	167.055
15.448	76.158
15.512	142.416
15.537	120.348
15.750	82.769
15.769	130.828
15.907	160.752
15.938	67.258
16.145	97.209
16.164	147.865
16.184	185.535
16.217	79.055
16.306	128.440
16.371	179.115
16.397	150.553
16.447	109.015
16.535	172.685
16.608	141.545
16.839	163.713
16.960	106.617
16.975	209.220
17.303	182.075
17.451	93.821
17.469	156.166
17.582	191.275
17.724	167.954
17.730	101.722
17.938	119.985
17.953	214.796
18.474	121.493
18.702	183.919
18.909	213.870
18.985	142.471
19.376	202.363
19.914	180.495
19.918	407.769
20.551	100.224
20.914	213.352
20.930	292.579
21.955	304.667
22.443	321.740
22.960	275.188
23.468	327.334
23.927	404.137
23.954	365.186
25.974	452.986
28.468	729.282];
units.LW   = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'CruzEspi1993'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 15 * weights.tL;
weights.Wwi = 2 * weights.Wwi;
weights.Li = 2 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01380*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3J97D'; % Cat of Life
metaData.links.id_ITIS = '630223'; % ITIS
metaData.links.id_EoL = '46578478'; % Ency of Life
metaData.links.id_Wiki = 'Haemulon'; % Wikipedia
metaData.links.id_ADW = 'Haemulon_maculicauda'; % ADW
metaData.links.id_Taxo = '175744'; % Taxonomicon
metaData.links.id_WoRMS = '275729'; % WoRMS
metaData.links.id_fishbase = 'Haemulon-maculicauda'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Haemulon}}';
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
bibkey = 'CruzEspi1993'; type = 'techreport'; bib = [ ... 
'author = {Cruz-Romero, M. and E. Espino-Barr and A. Garc\''{i}a-Boa}, ' ... 
'year = {1993}, ' ...
'title = {Aspectos poblacionales de cinco especies de la familia {H}aemulidae ({P}isces) en la costa de {C}olima, {M}exico}, ' ...
'journal = {Ciencia Pesquera. Inst. Nal. Pesca Sria. de Pesca. Mexico}, ' ...
'volume = {9}, ' ...
'pages = {43-54}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Haemulon-maculicauda.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
