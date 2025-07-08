function [data, auxData, metaData, txtData, weights] = mydata_Loxodon_macrorhinus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Loxodon_macrorhinus'; 
metaData.species_en = 'Sliteye shark'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MI', 'MPW'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 11 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data

data.ab = 11.5*30.5;  units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = 'guess';   
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 9*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'fishbase';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 54.5;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase'; 
  comment.Lb = '54 to 55  cm';
data.Lp  = 68;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'GuttHuve2013'; 
data.Lpm  = 73.3;  units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'GuttHuve2013'; 
data.Li  = 98;  units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';
data.Lim = 91; units.Lim  = 'cm'; label.Lim  = 'ultimate total length for males';    bibkey.Lim  = {'fishbase','GuttHuve2013'};
  comment.Lim = 'based on 98*83.2/89.5 cm, as found by GuttHuve2013'; 

data.Wwb = 1.1e3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on 0.00457*Lb^3.10, see F3';
data.Wwp = 2.2e3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';      bibkey.Wwp = {'fishbase','GuttHuve2013'};
  comment.Wwp = 'based on 0.00457*Lp^3.10, see F3';
data.Wwpm = 2.76e3;  units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males';      bibkey.Wwpm = {'fishbase','GuttHuve2013'};
  comment.Wwpm = 'based on 0.00457*Lpm^3.10, see F3';
data.Wwi = 6.8e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'fishbase','GuttHuve2013'};
  comment.Wwi = 'based on 0.00457*Li^3.10, see F3';
data.Wwim = 5.4e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';  bibkey.Wwim = {'fishbase','GuttHuve2013'};
  comment.Wwim = 'based on 0.00457*Lim^3.10, see F3';
 
data.Ri  = 1.9 /365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'GuttHuve2013';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'fishbase: 2 till 4 pups per litter, one litter per yr';

% uni-variate data
 
% time-length data 
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.458	62.634
0.589	57.216
0.676	62.563
0.676	63.882
0.687	68.604
0.780	63.465
0.781	65.826
0.791	67.562
0.800	66.520
1.434	65.543
1.700	70.958
2.051	76.580
2.164	73.871
2.516	78.937
2.799	76.018
3.036	76.642
3.121	76.780
3.764	76.080
3.792	74.969
3.793	77.608
3.869	79.413
3.935	77.329
3.935	79.065
3.944	77.954
3.953	73.510
3.953	74.482
4.039	79.481
4.058	78.509
4.125	79.480
4.153	79.064
4.513	82.672
4.607	78.227
4.901	82.252
4.930	81.766
4.939	80.169
4.939	80.933
4.939	83.016
4.967	77.738
5.024	78.918
5.034	81.348
5.034	82.112
5.053	82.737
5.071	80.029
5.146	78.223
5.147	81.695
5.185	79.820
5.609	73.497
5.923	81.619
5.951	79.536
5.951	80.230
5.952	83.564
5.960	76.133
5.962	85.230
5.971	83.008
5.980	81.341
6.047	85.507
6.131	79.465
6.160	81.062
6.170	85.367
6.462	80.574
6.898	80.292
6.926	81.334
6.974	82.167
7.154	84.249];
data.tL_f(:,1) = 365*data.tL_f(:,1); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth','total length', 'female'};  
temp.tL_f    = C2K(28);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'GuttHuve2013';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.277	57.080
0.288	63.955
0.316	62.913
0.525	66.314
0.780	64.020
0.780	64.576
0.941	63.533
1.047	69.851
1.055	66.240
1.170	72.420
1.273	66.377
1.434	66.862
1.679	63.041
1.784	67.554
1.785	69.082
1.785	70.193
1.851	68.595
1.918	72.067
2.116	69.079
2.126	70.190
2.126	70.676
3.433	75.389
3.566	77.610
3.593	73.998
3.594	74.554
3.876	70.385
4.692	79.198
5.137	79.125
5.298	79.471
5.696	82.663
5.705	78.149
5.913	76.758
6.056	81.063
6.822	80.987
7.711	78.967
7.759	80.494
8.640	83.473
8.953	87.846];
data.tL_m(:,1) = 365*data.tL_m(:,1); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth','total length', 'male'};  
temp.tL_m    = C2K(28);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'GuttHuve2013';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
%weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.kap = 2 * weights.psd.kap;
%weights.psd.p_M = 2 * weights.psd.p_M;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Viviparous';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Preferred temp 28 C, usually 7 - 100 m deep';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Ww (in g) = 0.00457*(TL in cm)^3.10';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '3W9KT'; % Cat of Life
metaData.links.id_ITIS = '160481'; % ITIS
metaData.links.id_EoL = '46559830'; % Ency of Life
metaData.links.id_Wiki = 'Loxodon_macrorhinus'; % Wikipedia
metaData.links.id_ADW = 'Loxodon_macrorhinus'; % ADW
metaData.links.id_Taxo = '41992'; % Taxonomicon
metaData.links.id_WoRMS = '217355'; % WoRMS
metaData.links.id_fishbase = 'Loxodon-macrorhinus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Loxodon_macrorhinus}}';
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
bibkey = 'GuttHuve2013'; type = 'Article'; bib = [ ...
'doi = {10.1071/MF12140}, ' ...
'author = {Adrian N. Gutteridge and Charlie Huveneers and Lindsay J. Marshall and Ian R. Tibbetts and Mike B. Bennett}, ' ... 
'year = {2013}, ' ...
'title = {Life-history traits of a small-bodied coastal shark}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {64}, ' ...
'pages = {54-65}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Loxodon-macrorhinus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

