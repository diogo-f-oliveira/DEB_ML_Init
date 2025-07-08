function [data, auxData, metaData, txtData, weights] = mydata_Glaucostegus_typus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rhinopristiformes'; 
metaData.family     = 'Glaucostegidae';
metaData.species    = 'Glaucostegus_typus'; 
metaData.species_en = 'Common shovelnose ray'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW', 'MI'};
metaData.ecoCode.habitat = {'0iMcd', '0iMm'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2019 03 19];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 19]; 

%% set data
% zero-variate data;
data.am = 18*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'WhitSimp2014';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 39;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'WhitSimp2014';
  comment.Lb = '38 to 40 cm';
data.Lp  = 165;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'WhitSimp2014';
  comment.Lp = '150 to 180 cm';
data.Li  = 270;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 369; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = {'fishbase','WhitSimp2014'};
 comment.Wwb = 'estimate based on 0.00646*Lb^2.99, see F2';
data.Wwp = 27.6e3; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','WhitSimp2014'};
 comment.Wwp = 'estimate based on 0.00646*Lp^2.99, see F2';
data.Wwi = 1.2e5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
 comment.Wwi = 'estimate based on 0.00646*Li^2.99, see F2';

data.Ri  = 14/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'WhitSimp2014';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '7 to 19 pups per yr';
  
% uni-variate data at f
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.009	63.830
0.023	52.128
0.933	132.979
0.943	51.064
0.969	87.766
0.970	84.043
0.971	68.617
1.976	132.979
1.983	74.468
1.983	70.213
1.984	63.830
1.984	61.170
1.985	53.191
2.010	100.000
2.011	89.894
2.039	112.234
2.040	105.319
2.899	105.851
2.899	103.723
2.899	101.064
2.931	96.277
2.932	84.043
2.933	79.255
2.984	160.638
2.988	130.319
2.995	74.468
2.996	62.766
3.020	119.681
3.880	105.851
3.973	97.872
4.923	105.319
4.946	163.298
4.976	172.340
4.980	135.106
4.982	124.468
4.982	121.277
5.953	207.447
5.956	177.128
5.958	165.426
5.961	141.489
5.967	94.681
6.936	190.426
6.937	185.638
6.937	181.383
6.964	213.298
6.970	165.426
6.973	135.638
6.974	135.106
7.003	146.809
7.939	261.702
7.944	221.277
7.979	187.766
8.954	237.234
8.997	136.170
9.963	264.894
9.967	229.787
10.979	231.383
10.985	182.979
11.019	151.596
13.918	267.021
13.920	250.000
16.926	244.681
17.933	283.511];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(28); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'WhitSimp2014';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males and females are assumed not to differ';
D2 = 'Temperatures are guessed, based in preferred temperature as given in fishbase';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'ovoviviparous';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-weight: Ww in g = 0.00646*(TL in cm)^2.99';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3G6MZ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46560704'; % Ency of Life
metaData.links.id_Wiki = 'Glaucostegus_typus'; % Wikipedia
metaData.links.id_ADW = 'Glaucostegus_typus'; % ADW
metaData.links.id_Taxo = '1684076'; % Taxonomicon
metaData.links.id_WoRMS = '280875'; % WoRMS
metaData.links.id_fishbase = 'Glaucostegus-typus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Glaucostegus_typus}}'; 
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
bibkey = 'WhitSimp2014'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jfb.12359}, ' ...
'author = {J. White and C. A. Simpfendorfer and A. J. Tobin and M. R. Heupel}, ' ...
'year = {2014}, ' ...
'title  = {Age and growth parameters of shark-like batoids}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {84}, ' ...
'pages = {1340-1353}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Glaucostegus-typus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  