function [data, auxData, metaData, txtData, weights] = mydata_Assiminea_japonica
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Littorinimorpha'; 
metaData.family     = 'Assimineidae';
metaData.species    = 'Assiminea_japonica'; 
metaData.species_en = 'Saltmarsh snail'; 

metaData.ecoCode.climate = {'Cfb', 'Cwb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl', '0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHa', 'biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L','t-Wd'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 27]; 

%% set data
% zero-variate data

data.am = 34*30.5;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'KuraKiku1999';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 0.6; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'KuraKiku2000';
  comment.Lp = 'based on tp 17 mnth';
data.Li  = 0.85; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'KuraKiku2000';

data.Wwb = 8.2e-6; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'KuraKiku2000';
  comment.Wwb = 'based on egg diameter of 250 mum: pi/6*0.025^3';
 
data.Ri  = 113/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since 1 March (d), shell length (cm)
121.686	0.270
152.536	0.193
181.095	0.253
212.821	0.290
241.621	0.307
276.676	0.293
305.372	0.328
332.756	0.327
361.774	0.305
366.122	0.335
397.961	0.376
429.892	0.400
458.642	0.447
488.896	0.498
520.792	0.528
549.507	0.581
580.108	0.571
613.601	0.589
637.943	0.606
670.094	0.592
703.657	0.598
728.126	0.592
760.138	0.602
788.980	0.633
819.604	0.619
853.202	0.619
880.470	0.657
913.883	0.690
945.999	0.682
976.577	0.676
1004.019	0.684
1036.043	0.693
1061.981	0.697
1094.121	0.685
1126.214	0.681];
units.tL   = {'d', 'cm'};  label.tL = {'time since 1 March', 'shell length'};  
temp.tL    = C2K(17);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KuraKiku1999';

% time-weight
data.tWd = [ ... % time since 1 March (d), ashfree dry weight (mg)
117.638	0.369
150.740	0.158
181.136	0.266
211.530	0.388
240.606	0.480
275.005	0.406
302.747	0.559
337.131	0.560
362.238	0.606
364.926	0.440
393.931	0.847
422.997	0.997
455.979	1.420
483.651	1.949
515.293	2.463
545.552	3.295
573.344	3.188
605.046	3.383
636.714	3.761
667.180	3.502
697.562	3.683
729.342	3.469
757.068	3.710
787.390	4.209
819.173	3.980
846.939	4.010
882.500	4.781
910.120	5.583
943.230	5.324
971.025	5.201
1001.391	5.473
1034.410	5.699
1062.170	5.758
1093.964	5.469
1125.712	5.422];
units.tWd   = {'d', 'mg'};  label.tWd = {'time since 1 March', 'ash-free dry weight'};  
temp.tWd    = C2K(17);  units.temp.tWd = 'K'; label.temp.tWd = 'temperature';
bibkey.tWd = 'KuraKiku1999';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
F1 = 'temperature in C varies as T(t) = 17 + 14*sin(2*pi*(t-60)/365';
metaData.discussion = struct('F1',F1);

%% Facts
F1 = 'This species has a veliger stage';
metaData.bibkey.F1 = 'KuraKiku1999'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'HMFB'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '45395010'; % Ency of Life
metaData.links.id_Wiki = 'Assiminea'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3549094'; % Taxonomicon
metaData.links.id_WoRMS = '765239'; % WoRMS
metaData.links.id_molluscabase = '765239'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Assiminea}}';
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
bibkey = 'KuraKiku1999'; type = 'Article'; bib = [ ... 
'author = {Kengo Kurata and Eisuke Kikuchi}, ' ... 
'year = {1999}, ' ...
'title = {LIFE CYCLE AND PRODUCTION OF \emph{Assiminea japonica} V. {M}ARTENS AND \emph{Angustassiminea castanea} ({W}ESTERLUND) AT A REED MARSH IN {G}AMO {L}AGOON, {N}ORTHERN {J}APAN ({G}ASTROPODA: {A}SSIMINEIDAE)}, ' ...
'journal = {Ophelia}, ' ...
'volume = {50(3)}, ' ...
'pages = {191-214}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KuraKiku2000'; type = 'Article'; bib = [ ... 
'author = {Kengo Kurata and Eisuke Kikuchi}, ' ... 
'year = {2000}, ' ...
'title = {Comparisons of life-history traits and sexual dimorphism between \emph{Assiminea japonoca} and \emph{Angustassiminea castanea} ({G}astropoda: {A}ssimineidae}, ' ...
'journal = {J. Moll. Stud}, ' ...
'volume = {66}, ' ...
'pages = {177-196}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

