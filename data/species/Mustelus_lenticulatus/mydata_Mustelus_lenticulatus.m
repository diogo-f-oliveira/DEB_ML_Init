function [data, auxData, metaData, txtData, weights] = mydata_Mustelus_lenticulatus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Triakidae';
metaData.species    = 'Mustelus_lenticulatus'; 
metaData.species_en = 'Spotted estuary smooth-hound'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MISE'};
metaData.ecoCode.habitat = {'0iMd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13.7); % K, body temperature
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 19];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 30];

%% set data
% zero-variate data;
data.am = 20*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'FranMaol2000';   
  temp.am = C2K(13.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 25;     units.Lb  = 'cm';    label.Lb  = 'total length at birth';  bibkey.Lb  = 'fishbase';
  comment.Lb = '20-32 cm';
data.Lp = 100;  units.Lp  = 'cm';    label.Lp  = 'total length at puberty';bibkey.Lp  = 'FranMaol2000';
data.Lpm = 85; units.Lpm  = 'cm';    label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'FranMaol2000';
data.Li  = 151;  units.Li  = 'cm';    label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';
data.Lim  = 125; units.Lim  = 'cm'; label.Lim  = 'ultimate total length for males';  bibkey.Lim  = 'fishbase';

data.Wwi  = 31.7e3;  units.Wwi  = 'g';    label.Wwi  = 'ultimate wet weight';  bibkey.Wwi  = {'fishbase','FranMaol2000'};
  comment.Wwi = 'based on 0.00200*Li^3.13, see F3';
data.Wwim  = 21.8e3;  units.Wwim  = 'g';    label.Wwim  = 'ultimate wet weight for males';  bibkey.Wwim  = {'fishbase','FranMaol2000'};
  comment.Wwim = 'based on 0.00200*Lim^3.13, see F3';

data.Ri  = 15/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(13.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4-20 pups per litter, 1 litter per  yr assumed';
    
% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.487	36.214
0.508	42.943
0.550	41.662
0.550	39.420
1.037	51.606
1.546	58.666
1.546	56.424
1.546	54.501
1.609	64.434
1.609	60.270
1.609	53.542
1.609	50.018
1.990	57.075
2.033	61.561
2.498	64.136
2.498	59.971
2.520	69.262
2.520	67.660
2.520	65.097
2.541	75.990
2.562	71.185
2.562	66.700
2.562	62.536
2.583	58.051
3.515	80.179
3.536	70.889
3.536	84.344
3.557	76.656
3.578	71.851
3.578	87.229
3.959	75.385
4.002	73.784
4.023	80.192
4.023	76.027
4.489	80.844
4.510	92.057
4.510	94.300
4.552	83.408
4.552	85.971
4.997	73.488
5.060	92.071
5.103	87.266
5.463	79.586
5.484	90.800
5.526	85.355
5.526	96.888
5.547	86.957
5.992	102.025
7.008	110.380
7.474	98.217
7.516	105.266
9.020	101.779
9.549	121.014
12.068	138.056];
data.tL_f(:,1) = data.tL_f(:,1)*365; % % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(13.7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'FranMaol2000';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (mm)
0.508	35.574
0.635	49.033
1.524	50.977
1.588	66.036
1.588	53.862
1.609	56.746
1.990	64.444
2.011	57.717
2.011	66.046
2.498	65.097
2.541	79.835
2.541	61.894
2.562	76.311
2.583	72.467
2.604	78.875
2.604	74.390
3.007	67.352
3.007	80.487
3.091	74.723
4.573	79.885
4.573	71.876
4.573	88.535
4.573	89.496
4.573	90.777
4.976	82.778
5.081	79.897
5.081	85.984
5.484	101.692
5.505	82.791
5.526	98.490
5.547	95.927
5.547	87.277
5.568	100.733
5.568	88.559
6.013	90.813
6.013	96.259
6.034	87.610
6.034	98.823
6.077	97.222
6.564	101.398
6.564	100.437
6.564	98.195
6.564	96.913
7.050	98.848
7.050	100.129
7.050	101.090
7.050	108.138
7.072	86.995
7.495	111.673
7.537	94.054
7.580	100.462
8.003	102.075
8.067	95.669
8.067	97.591
8.511	105.932
8.575	103.050
9.041	104.663
9.485	115.567
9.591	107.880
10.523	124.242];
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(13.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'FranMaol2000';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'aplacental viviparous';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'demersal; depth range 0 - 400 m'; 
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'length-weight: Ww in g  = 0.00200 * (TL in cm)^3.13';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '44R2D'; % Cat of Life
metaData.links.id_ITIS = '160258'; % ITIS
metaData.links.id_EoL = '46559997'; % Ency of Life
metaData.links.id_Wiki = 'Mustelus_lenticulatus'; % Wikipedia
metaData.links.id_ADW = 'Mustelus_lenticulatus'; % ADW
metaData.links.id_Taxo = '106428'; % Taxonomicon
metaData.links.id_WoRMS = '271388'; % WoRMS
metaData.links.id_fishbase = 'Mustelus-lenticulatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mustelus_lenticulatus}}';  
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
bibkey = 'FranMaol2000'; type = 'article'; bib = [ ... 
'author = {Malcolm P. Francis and Caoimhghin \''{O} Maolag\''{a}in}, ' ...
'year = {2000}, ' ...
'title  = {Age, growth and maturity of a {N}ew {Z}ealand endemic shark (\emph{Mustelus lenticulatus}) estimated from vertebral bands}, ' ...
'journal = {Mar. Freshwater Res.}, ' ...
'volume = {51}, ' ...
'pages = {35-42}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Mustelus-lenticulatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

