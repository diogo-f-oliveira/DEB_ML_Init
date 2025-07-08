function [data, auxData, metaData, txtData, weights] = mydata_Cavia_porcellus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Caviidae';
metaData.species    = 'Cavia_porcellus'; 
metaData.species_en = 'Guinea pig'; 

metaData.ecoCode.climate = {'BWk'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTh', '0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2017 12 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 68;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(39);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 18;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(39);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 66;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(39); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 76;   units.tpm = 'd';     label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(39); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 12*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(39); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 85;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 228;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 728;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 3.8*5/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(39); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3.8 pups per litter; 5 litters per yr';

% univariate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
1.242	91.985
16.508	156.202
30.938	252.628
30.993	269.494
54.942	399.539
60.267	301.342
84.417	492.718
86.334	503.428
87.965	426.742
89.711	385.321
89.917	448.185
114.682	539.887
114.702	546.021
119.387	539.831
120.022	446.290
120.157	487.688
120.707	368.082
146.729	556.369
146.754	564.035
149.396	508.803
151.120	747.983
151.692	347.776
178.050	638.792
178.710	552.917
180.783	611.159
182.090	723.077
182.938	407.200
206.684	762.648
212.538	538.711
213.030	688.971
213.291	768.702
236.121	556.827
239.722	794.450
240.392	711.642
240.573	766.840
269.656	740.424
272.308	688.259
272.408	718.924
272.584	772.589
299.846	764.594
300.616	712.451
302.407	684.830
329.840	728.967
329.955	764.232
333.393	664.524
361.590	654.985
361.746	702.516];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39);  units.temp.tW = 'K'; label.temp.tW = 'temperature'; 
bibkey.tW = 'Rood1972';
%
data.tW_f = [ % time since birth (d), weight (g)
    56 210
    70 260
    84 300
   120 400
   150 500
   180 600
   310 625
   320 650
   360 675
   300 700
   360 750
   374 800]; 
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'total weight', 'female'};  
temp.tW_f  = C2K(39);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'guineapigsite';
comment.tW_f = 'Data for females';
% 
data.tW_m = [ ... % time since birth (d), weight (g)
    56  210
    70  260
    84  300
   120  420
   150  540
   180  660
   310  720
   320  780
   360  840
   300  800
   360  950
   374 1100]; 
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'total weight', 'male'};  
temp.tW_m  = C2K(39);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'guineapigsite';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
weights.Wwx = 0 * weights.Wwx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumend to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = 'RY7S'; % Cat of Life
metaData.links.id_ITIS = '584713'; % ITIS
metaData.links.id_EoL = '326924'; % Ency of Life
metaData.links.id_Wiki = 'Cavia_porcellus'; % Wikipedia
metaData.links.id_ADW = 'Cavia_porcellus'; % ADW
metaData.links.id_Taxo = '63446'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13400181'; % MSW3
metaData.links.id_AnAge = 'Cavia_porcellus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cavia_porcellus}}';
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
bibkey = 'Rood1972'; type = 'Article'; bib = [ ... 
'author = {Rood, J. P.}, ' ... 
'year = {1972}, ' ...
'title = {Ecological and behavioral comparisons of three genera of {A}rgentine cavies}, ' ...
'journal = {Anim. Behav. Monogr.}, ' ...
'volume = {5}, ' ...
'pages = {1-83}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cavia_porcellus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'guineapigsite'; type = 'Misc'; bib = ...
'howpublished = {\url{https://guineapigsite.com/guinea-pig-growth-chart/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

