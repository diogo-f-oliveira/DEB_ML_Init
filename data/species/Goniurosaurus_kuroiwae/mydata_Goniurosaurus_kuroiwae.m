function [data, auxData, metaData, txtData, weights] = mydata_Goniurosaurus_kuroiwae
%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Eublepharidae';
metaData.species    = 'Goniurosaurus_kuroiwae';
metaData.species_en = 'Kuroiwa''s ground gecko';

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data;
data.ab = 30;  units.ab = 'd';      label.ab = 'age at birth';             bibkey.ab = 'guess';
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'KuriToda2013';
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 2.4;     units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
data.Lp  = 7.5;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'KuriToda2013';
data.Li  = 9.58; units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'KuriToda2013';
data.Lim  = 9.02; units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'KuriToda2013';

data.Wwi = 20.18; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'EoL';

data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per clutch, assumed: 2 clutches per yr';

% univariate data
% time-length
data.tL_f = [... % time since birth (d), SVL (cm)
0.000	4.929
0.000	4.595
3.562	4.836
32.058	5.115
35.620	5.636
35.620	5.524
181.664	3.703
260.029	6.045
263.591	5.217
267.153	5.701
281.401	6.026
299.212	5.320
306.336	6.342
306.336	5.617
309.898	6.026
324.146	6.342
327.708	6.816
331.270	6.007
334.832	6.230
338.394	7.206
338.394	5.710
356.204	6.221
363.328	7.615
363.328	6.519
366.890	6.454
370.453	5.626
377.577	6.807
391.825	7.011
541.431	7.309
605.547	7.996
644.730	6.993
666.102	8.312
666.102	8.796
666.102	7.420
669.664	8.489
669.664	8.693
673.226	7.086
680.350	7.234
701.723	7.680
701.723	9.000
705.285	8.414
726.657	7.216
733.781	8.312
758.715	8.099
765.839	7.494
976.000	8.414
976.000	8.015
1032.993	9.121
1032.993	8.805
1065.051	7.699
1093.547	8.507
1097.109	9.316
1100.672	9.613
1100.672	9.195
1129.168	8.814
1129.168	8.312
1132.730	9.307
1136.292	8.647
1136.292	8.535
1157.664	7.801
1161.226	8.712
1399.883	9.009
1399.883	9.520
1403.445	9.223
1428.380	8.600
1464.000	9.093
1553.051	8.907
1770.336	9.204
1791.708	9.102
1798.832	8.703
1838.015	9.093
2133.664	8.712
2165.723	9.316
2500.555	9.604
2532.613	9.511];
units.tL_f  = {'d', 'cm'}; label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(15); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KuriToda2013';
comment.tL_f = 'Data for females';
%
data.tL_m = [... % time since birth (d), SVL (cm)
630.482	8.628
637.606	8.507
641.168	7.717
662.540	8.219
666.102	7.801
666.102	7.903
698.161	8.015
705.285	7.513
730.219	8.219
733.781	7.913
762.277	7.708
801.460	8.219
968.876	7.903
972.438	7.587
993.810	8.610
1011.620	7.885
1015.182	8.210
1022.307	8.433
1029.431	8.126
1032.993	8.331
1043.679	8.628
1061.489	7.903
1065.051	8.349
1075.737	8.210
1079.299	8.015
1097.109	8.823
1100.672	7.792
1104.234	8.647
1339.328	8.201
1371.387	8.294
1399.883	8.526
1403.445	7.708
1407.007	8.805
1428.380	8.507
1834.453	8.201
2133.664	8.814];
units.tL_m  = {'d', 'cm'}; label.tL_m = {'time since birth', 'SVL', 'male'};  
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
temp.tL_m   = C2K(15); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KuriToda2013';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 10 * weights.Li;
weights.Lb = 5 * weights.Lb;
weights.Lp = 10 * weights.Lp;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% facts
F1 = 'Endemic to 11 islands of the Central Ryukyus';
metaData.bibkey.F1 = 'KuriToda2013'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3GXYV'; % Cat of Life
metaData.links.id_ITIS = '818629'; % ITIS
metaData.links.id_EoL = '793484'; % Ency of Life
metaData.links.id_Wiki = 'Goniurosaurus_kuroiwae'; % Wikipedia
metaData.links.id_ADW = 'Goniurosaurus_kuroiwae'; % ADW
metaData.links.id_Taxo = '641247'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Goniurosaurus&species=kuroiwae'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Goniurosaurus_kuroiwae}}';   
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
bibkey = 'KuriToda2013'; type = 'Article'; bib = [ ...  
'doi = {10.3724/SP.J.1245.2013.00233}, ' ...
'author = {Takaki Kurita and Mamoru Toda}, ' ...
'title = {Validation and Application of Skeletochronology for Age Determination of the {R}yukyu Ground Gecko, \emph{Goniurosaurus kuroiwae} ({S}quamata: {E}ublepharidae)}, ' ...
'journal = {Asian Herpetological Research}, ' ...
'volume = {4(4)}, ' ...
'pages = {233–241}, ' ...
'year = {2013}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/793484}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

