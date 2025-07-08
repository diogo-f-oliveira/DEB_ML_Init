function [data, auxData, metaData, txtData, weights] = mydata_Microcebus_murinus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Cheirogaleidae';
metaData.species    = 'Microcebus_murinus'; 
metaData.species_en = 'Gray mouse lemur'; 

metaData.ecoCode.climate = {'Aw', 'BSh'};
metaData.ecoCode.ecozone = {'TPam'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TW'};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 06 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 14]; 


%% set data
% zero-variate data

data.tg = 61;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from GeniPerr2003';
data.tx = 37;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 243;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am =18.3*365/2; units.am = 'd'; label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'corrected for torpor by factor 2';
  
data.Li  = 13;   units.Li  = 'cm';  label.Li  = 'ultimate body length';    bibkey.Li  = 'Wiki';
  comment.Li = '12-14 cm; tail 13-14.5 cm';

data.Wwb = 6;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 14;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'guess';
data.Wwi = 64.8; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1/73; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), length (cm)
0.028	1.216
0.052	1.303
0.060	1.352
0.060	1.402
0.043	1.501
0.027	1.600
0.123	1.613
0.099	1.650
0.075	1.687
0.050	1.911
0.114	1.997
0.050	2.035
0.066	2.084
0.106	2.171
0.089	2.196
0.057	2.295
0.137	2.345
0.081	2.357
0.105	2.481
0.080	2.506
0.072	2.543
0.056	2.705
0.080	2.692
0.152	2.679
0.095	2.829
0.120	2.828
0.111	2.915
0.168	2.890
0.167	2.990
0.119	3.002
0.095	3.101
0.151	3.114
0.199	3.064
0.215	3.138
0.175	3.188
0.143	3.201
0.134	3.250
0.239	3.225
0.239	3.287
0.190	3.300
0.166	3.312
0.158	3.325
0.158	3.399
0.158	3.461
0.230	3.448
0.271	3.362
0.359	3.448
0.383	3.510
0.376	3.250
0.536	3.336
0.471	3.497
0.463	3.560
0.527	3.609
0.551	3.671
0.519	3.708
0.607	3.758
0.551	3.857
0.510	3.820
0.486	3.882
0.462	3.919
0.550	3.994
0.558	4.080
0.501	4.229
0.373	4.019
0.317	4.007
0.285	3.907
0.309	3.870
0.350	3.858
0.390	3.758
0.382	3.696
0.294	3.659
0.270	3.597
0.246	3.573
0.190	3.560
0.213	3.684
0.237	3.821
0.294	3.758
0.350	3.609
0.406	3.857
0.406	3.907
0.839	4.067
1.008	4.216
1.026	3.657
1.025	3.806
1.106	3.570
1.113	3.930
1.210	3.930
1.249	4.116
1.314	3.942
1.323	3.830
1.435	3.867
1.418	4.090
1.613	3.643
2.014	4.114
2.240	3.815
2.232	3.865
2.303	4.038
2.432	4.187
2.601	4.124
3.020	3.900
3.108	4.061
3.301	4.073
3.316	4.184
3.501	4.246
3.630	4.059
3.703	3.948
4.025	3.810
4.017	3.910
4.000	4.071
4.218	3.946
4.306	4.120
4.710	3.573
5.014	3.870
5.207	4.117
5.296	3.956
5.401	3.794
5.504	4.302
6.002	4.264
6.308	4.300
6.398	3.915
6.598	4.076
6.783	3.989
7.982	3.936
7.998	4.047
7.997	4.159
8.585	4.009];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'tibia length'};  
temp.tL    = C2K(37.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CastCroc2004';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'body temp during topor 7C (= ambient in May-August). Females hibernate longer than males';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'body temp can easily drop in response to starvation';
metaData.bibkey.F2 = 'GeniPerr2003'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '42SBX'; % Cat of Life
metaData.links.id_ITIS = '572861'; % ITIS
metaData.links.id_EoL = '324404'; % Ency of Life
metaData.links.id_Wiki = 'Microcebus_murinus'; % Wikipedia
metaData.links.id_ADW = 'Microcebus_murinus'; % ADW
metaData.links.id_Taxo = '65426'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100019'; % MSW3
metaData.links.id_AnAge = 'Microcebus_murinus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Microcebus_murinus}}';
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
bibkey = 'CastCroc2004'; type = 'Article'; bib = [ ... 
'author = {J. Castanet and S. Croci and F. Aujard and M. Perret and J. Cubo and E. de Margerie}, ' ... 
'year = {2004}, ' ...
'title = {Lines of arrested growth in bone and age estimation in a small primate: \emph{Microcebus murinus}}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {263}, ' ...
'pages = {31-39}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GeniPerr2003'; type = 'Article'; bib = [ ... 
'author = {F. G\''{e}nin and M. Perret.}, ' ... 
'year = {2003}, ' ...
'title = {Daily hypothermia in captive grey mouse lemurs (\emph{Microcebus murinus}): effects of photoperiod and food restriction}, ' ...
'journal = {Comparative Biochemistry and Physiology Part B}, ' ...
'volume = {136}, ' ...
'pages = {71-81}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Microcebus_murinus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

