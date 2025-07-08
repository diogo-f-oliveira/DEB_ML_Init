function [data, auxData, metaData, txtData, weights] = mydata_Mustelus_antarcticus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Triakidae';
metaData.species    = 'Mustelus_antarcticus'; 
metaData.species_en = 'Gummy shark'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIE'};
metaData.ecoCode.habitat = {'0iMd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temperature
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'WWi'; 'Ri'};  
metaData.data_1     = {'t-L_f'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 02];

%% set data
% zero-variate data;
data.ab = 365*11.5/12; units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'fishbase';   
  temp.ab = C2K(16); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'gestation time 11-12 months';
data.am = 45*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'MoulWalk1992';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'fishbase gives 16 yrs';

data.Lb = 32.5;     units.Lb  = 'cm';    label.Lb  = 'total length at birth';  bibkey.Lb  = 'fishbase';
  comment.Lb = '30-35 cm';
data.Lp = 119.5;  units.Lp  = 'cm';    label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase';
  comment.Lp = '85-130 cm';
data.Li  = 175;  units.Li  = 'cm';    label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';
data.Lim  = 157;  units.Lim  = 'cm';    label.Lim  = 'ultimate total length';  bibkey.Lim  = 'fishbase';

data.Wwp = 7.5e3;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';       bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00224*Li^3.14, see F1';
data.Wwi = 24.7e3;   units.Wwi = 'g';   label.Wwi = 'wet weight at puberty';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00224*Li^3.14, see F1';

data.Ri  = 19/365/2;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 to 38 pups per litter, 1 litter per 2 yr assumed';
    
% univariate data

% time-length
data.tL_BS75f = [ ... % time since birth (yr), total length (cm)
 1.384	 95.253
 2.499	 86.848
 3.444	 99.455
 4.448	111.362
 5.628	121.167
 6.572	129.572
 7.573	134.475
 8.634	140.078
 9.519	147.782
10.405	159.689
11.519	149.183
12.519	149.883
13.523	161.790];
data.tL_BS75f(:,1) = (0.3+data.tL_BS75f(:,1))*365; % % convert yr to d
units.tL_BS75f = {'d', 'cm'};     label.tL_BS75f = {'time since birth', 'total length', 'female'};  
temp.tL_BS75f = C2K(16);  units.temp.tL_BS75f = 'K'; label.temp.tL_BS75f = 'temperature';
bibkey.tL_BS75f = 'MoulWalk1992';
comment.tL_BS75f = 'Data for females, caught in 1973-1976 in Bass Strait';
%
data.tL_BS75m = [ ... % time since birth (yr), total length (cm)
 0.542	 38.263
 2.440	 88.891
 3.561	 97.413
 4.565	108.725
 5.507	113.726
 6.510	121.536
 7.511	125.143
 8.572	130.157
 9.388	107.130
10.514	132.463];
data.tL_BS75m(:,1) = (0.3+data.tL_BS75m(:,1))*365; % convert yr to d
units.tL_BS75m = {'d', 'cm'};     label.tL_BS75m = {'time since birth', 'total length', 'male'};  
temp.tL_BS75m = C2K(16);  units.temp.tL_BS75m = 'K'; label.temp.tL_BS75m = 'temperature';
bibkey.tL_BS75m = 'MoulWalk1992';
comment.tL_BS75m = 'Data for males, caught in 1973-1976 in Bass Strait';
%
data.tL_BS86f = [ ... % time since birth (yr), total length (cm)
 0.374	 63.503
 1.495	 74.705
 2.320	 78.920
 3.675	 84.549
 4.502	 96.438
 5.565	110.429
 6.626	114.652
 7.625	112.594
 8.632	134.257
 9.512	128.008
12.583	165.092
13.696	149.782
14.579	152.604
16.640	159.652];
data.tL_BS86f(:,1) = (0.3+data.tL_BS86f(:,1))*365; % % convert yr to d
units.tL_BS86f = {'d', 'cm'};     label.tL_BS86f = {'time since birth', 'total length', 'female'};  
temp.tL_BS86f = C2K(16);  units.temp.tL_BS86f = 'K'; label.temp.tL_BS86f = 'temperature';
bibkey.tL_BS86f = 'MoulWalk1992';
comment.tL_BS86f = 'Data for females, caught in 1986-1987 in Bass Strait';
%
data.tL_BS86m = [ ... % time since birth (yr), total length (cm)
2.475	79.526
3.527	86.539
4.578	92.855
5.515	102.655
6.622	102.694
7.499	109.701
8.434	114.617
9.427	120.233
10.533	116.086
11.468	121.002
13.399	141.302];
data.tL_BS86m(:,1) = (0.3+data.tL_BS86m(:,1))*365; % convert yr to d
units.tL_BS86m = {'d', 'cm'};     label.tL_BS86m = {'time since birth', 'total length', 'male'};  
temp.tL_BS86m = C2K(16);  units.temp.tL_BS86m = 'K'; label.temp.tL_BS86m = 'temperature';
bibkey.tL_BS86m = 'MoulWalk1992';
comment.tL_BS86m = 'Data for males, caught in 1986-1987 in Bass Strait';
%
data.tL_SA75f = [ ... % time since birth (yr), total length (cm)
 1.549	 74.464
 2.550	 86.547
 3.551	 99.338
 4.667	103.630
 5.549	109.330
 6.606	114.329
 7.547	120.740
 8.370	128.564
 9.485	130.730
10.485	137.143
11.601	142.852
12.542	151.389
13.540	155.677
14.481	162.088
15.472	142.989];
data.tL_SA75f(:,1) = (0.3+data.tL_SA75f(:,1))*365; % % convert yr to d
units.tL_SA75f = {'d', 'cm'};     label.tL_SA75f = {'time since birth', 'total length', 'female'};  
temp.tL_SA75f = C2K(16);  units.temp.tL_SA75f = 'K'; label.temp.tL_SA75f = 'temperature';
bibkey.tL_SA75f = 'MoulWalk1992';
comment.tL_SA75f = 'Data for females, caught in 1986-1987 in South Australia';
%
data.tL_SA75m = [ ... % time since birth (yr), total length (cm)
 2.413	 90.000
 3.577	 95.669
 4.510	102.756
 5.500	107.717
 6.431	109.134
 7.480	118.346
 8.469	121.181
 9.342	121.890
10.446	121.890
11.437	128.268];
data.tL_SA75m(:,1) = (0.3+data.tL_SA75m(:,1))*365; % convert yr to d
units.tL_SA75m = {'d', 'cm'};     label.tL_SA75m = {'time since birth', 'total length', 'male'};  
temp.tL_SA75m = C2K(16);  units.temp.tL_SA75m = 'K'; label.temp.tL_SA75m = 'temperature';
bibkey.tL_SA75m = 'MoulWalk1992';
comment.tL_SA75m = 'Data for males, caught in 1986-1987 in South Australia';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_BS75f','tL_BS75m'}; subtitle1 = {'Data for females, males'};
set2 = {'tL_BS86f','tL_BS86m'}; subtitle2 = {'Data for females, males'};
set3 = {'tL_SA75f','tL_SA75m'}; subtitle3 = {'Data for females, males'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00224*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '44QZR'; % Cat of Life
metaData.links.id_ITIS = '160249'; % ITIS
metaData.links.id_EoL = '46559990'; % Ency of Life
metaData.links.id_Wiki = 'Mustelus_antarcticus'; % Wikipedia
metaData.links.id_ADW = 'Mustelus_antarcticus'; % ADW
metaData.links.id_Taxo = '106420'; % Taxonomicon
metaData.links.id_WoRMS = '271380'; % WoRMS
metaData.links.id_fishbase = 'Mustelus_antarcticus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mustelus_antarcticus}}';  
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
bibkey = 'MoulWalk1992'; type = 'article'; bib = [ ... 
'doi = {10.1071/mf9921241}, ' ...
'author = {Moulton, P.L. and Walker, T.I. and Saddlier, S.R.}, ' ...
'year = {1992}, ' ...
'title  = {Age and growth studies of Gummy Shark, \emph{Mustelus antarcticus} {G}unther, and School Shark, \emph{Galeorhinus galeus} ({L}innaeus), from Southern Australian Waters}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {43(5)}, ' ...
'pages = {1241-1267}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Mustelus-antarcticus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

