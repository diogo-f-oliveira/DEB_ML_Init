function [data, auxData, metaData, txtData, weights] = mydata_Ornithorhynchus_anatinus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Monotremata'; 
metaData.family     = 'Ornithorhynchidae';
metaData.species    = 'Ornithorhynchus_anatinus'; 
metaData.species_en = 'Platypus';

metaData.ecoCode.climate = {'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0xTf', 'xiFc'};
metaData.ecoCode.embryo  = {'Tnt'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(32); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2013 07 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2018 01 15];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 01 15]; 

%% set data
% zero-variate data

data.ab = 28+10;        units.ab = 'd';    label.ab = 'incubation time';         bibkey.ab = 'Wiki';   
  temp.ab = C2K(29); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'external incubation 10 d, but develops 28 d in uterus';
data.tx = 4.5*30.5;  units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'JackFisk1998';   
  temp.tx = C2K(32); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 2*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'JackFisk1998';
  temp.tp = C2K(32); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 22.6*365;  units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(32); units.temp.am = 'K'; label.temp.am = 'temperature'; 

%data.L0  = 1.1;     units.L0  = 'cm';  label.L0  = 'egg length'; bibkey.Li  = 'Wiki';
%  comment.L0 = 'eggs slightly rounder than bird eggs';
data.Li  = 43;       units.Li  = 'cm';  label.Li  = 'ultimate total length for females'; bibkey.Li  = 'Wiki';
data.Lim  = 50;      units.Lim = 'cm';  label.Lim = 'ultimate total length for males';   bibkey.Lim  = 'Wiki';

data.Wwb = 0.47;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'guestimated from 4/3 * pi * r1 * r2 * r3, with r1 = r2 = 0.9/2 cm and r3 = 1.1/2 cm';
data.Wwi = 2400;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Kooy2010';
  comment.Wwi = 'Relates to Tasmanian population; AnAge gives 1250 g; ADW gives 1520 g';

data.Ri  = 2/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(32); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'clutch size 1-3';
 
% uni-variate data
% time-weight
data.tW_B = [ ... % time since birth (d), wet weight (g)
0.424	  0.010
9.368	164.775
19.152	289.298
30.629	393.662
40.405	481.968
49.752	546.140
59.521	598.229
70.135	638.226
79.475	670.205
89.662	694.115
101.121	713.972
109.613	745.970
120.651	781.934
130.418	825.975
139.769	910.267
150.803	930.134
160.575	998.320
170.757	998.085
180.094	1013.967
190.282	1045.926
200.048	1081.919
210.235	1105.830
220.419	1117.668
230.607	1145.603
241.216	1161.455
250.144	1249.781
260.346	1346.126
270.973	1446.485
280.319	1502.608
290.512	1558.712
299.862	1634.956
310.473	1658.857
321.082	1670.685];
units.tW_B   = {'d', 'g'};  label.tW_B = {'time since birth', 'wet weight', 'Barak'};  
temp.tW_B    = C2K(32);  units.temp.tW_B = 'K'; label.temp.tW_B = 'temperature';
bibkey.tW_B = 'JackFisk1998';
comment.tW_B = 'Data for Barak population; Till day 151 or 155, when young leave burrow, weights are predicted, not measured';
%
data.tW_Y = [ ... % time since birth (d), wet weight (g)
0.422	12.082
10.204	104.393
19.552	172.589
29.750	248.813
40.364	288.810
49.708	336.885
59.472	368.854
69.657	384.716
79.843	404.603
89.605	424.499
100.215	440.351
109.975	452.199
119.737	476.120
130.774	504.035
139.271	564.202
150.725	559.914
160.482	559.690
169.400	599.726
180.440	643.738
189.358	687.799
199.966	695.603
210.146	687.321
220.327	683.062
230.075	638.573
240.254	626.266
250.429	593.839];
units.tW_Y   = {'d', 'g'};  label.tW_Y = {'time since birth', 'wet weight', 'Yarra-Yarra'};  
temp.tW_Y    = C2K(32);  units.temp.tW_Y = 'K'; label.temp.tW_Y = 'temperature';
bibkey.tW_Y = 'JackFisk1998';
comment.tW_Y = 'Data for Yarra-Yarra population';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW_B = weights.tW_B * 2;  
weights.tW_B(1:16) = weights.tW_B(1:16) * 0.1; % these weights were predicted, not measured
weights.tW_Y = weights.tW_Y * 2;
weights.tW_Y(1:16) = weights.tW_Y(1:16) * 0.1; % these weights were predicted, not measured

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_B','tW_Y'}; subtitle1 = {'Data from Barak, Yarra-Yarra'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Till day 151 or 155, weights are predicted by JackFisk1998, not measured';
D3 = 'food intake till weaning is assumed to be higer than post-weaning';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'strong body size gradient from small in NE to large in SE Australia';
metaData.bibkey.F1 = 'Kooy2010'; 
F2 = ['sensitive electroreception in bill; males have no parental care; ' ... 
      'hatching young are blind, without hair and fed with milk; '...
      'after 5 w since birth, mother start spending time outside the burrow; '...
      'after 4 m since birth, young emerge from burrow'];
metaData.bibkey.F2 = 'Kooy2010'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '74WBV'; % Cat of Life
metaData.links.id_ITIS = '552524'; % ITIS
metaData.links.id_EoL = '323858'; % Ency of Life
metaData.links.id_Wiki = 'Ornithorhynchus_anatinus'; % Wikipedia
metaData.links.id_ADW = 'Ornithorhynchus_anatinus'; % ADW
metaData.links.id_Taxo = '105228'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '10300020'; % MSW3
metaData.links.id_AnAge = 'Ornithorhynchus_anatinus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ornithorhynchus_anatinus}}';
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
bibkey = 'JackFisk1998'; type = 'Techreport'; bib = [ ... 
'author = {Jackson, S. and Fisk, L. and Holland, N. and Serena, M. and Middleton, D.}, ' ... 
'year = {1998}, ' ...
'institution = {Australasian Zoo Keeping}, ' ...
'title = {Platypus \emph{Ornithorhynchus anatinus} Captive husbandry guidelines}, ' ...
'howpublished = {\url{http://www.australasianzookeeping.org/Husbandry Manuals/Platypus Husbandry Manual s.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Ornithorhynchus_anatinus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Ornithorhynchus_anatinus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
