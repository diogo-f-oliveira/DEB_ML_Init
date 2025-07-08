function [data, auxData, metaData, txtData, weights] = mydata_Paralithodes_camtschaticus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Lithodidae';
metaData.species    = 'Paralithodes_camtschaticus'; 
metaData.species_en = 'Red king crab'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MPN', 'MN'};
metaData.ecoCode.habitat = {'0bMb', 'bjMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'biD', 'jiCi', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7); % K, body temp
metaData.data_0     = {'ab', 'aj', 'ap', 'am', 'Lp', 'Li', 'Wwb', 'Wwj', 'Wwp', 'Wwi', 'Ri'}; 
metaData.data_1     = {'Ww-JX', 'Ww-dWw', 't-Ww'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2017 09 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 02]; 

%% set data
% zero-variate data

data.ab = 360;  units.ab = 'd'; label.ab = 'age at birth'; bibkey.ab = 'ADW';   
  temp.ab = C2K(7); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 62;  units.tj = 'd'; label.tj = 'time since birth at metam'; bibkey.tj = 'nobanis';   
  temp.tj = C2K(7.5); units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 6*365;  units.tp = 'd';    label.tp = 'time since metam at puberty';  bibkey.tp = 'LoheArms2001';
  temp.tp = C2K(7); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '5-8 yr';
data.am = 30*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'ADW';   
  temp.am = C2K(7);   units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 9.7;  units.Lp  = 'cm';  label.Lp  = 'carapace length at puberty for females'; bibkey.Lp  = 'LoheArms2001';
data.Lpm  = 10.5;  units.Lpm  = 'cm';  label.Lpm  = 'carapace length at puberty for males'; bibkey.Lpm  = 'LoheArms2001';
data.Li  = 22;  units.Li  = 'cm';  label.Li  = 'ultimate carapace length'; bibkey.Li  = 'nobanis';
  comment.Li = '1.8 m legg span, see EoL';

data.Wwb = 5.24e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'seagrant';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wdj = 1.0e-3;  units.Wdj = 'g';   label.Wdj = 'dry weight at metam';       bibkey.Wdj = 'nobanis';
data.Wwp = 840;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'ZhouShir1998';
  comment.Wwp = 'Computed as (Lp/ Li)^3 * Wwi';
data.Wwi = 8e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'guess';
  comment.Wwi = 'max weight can be larger';
data.Wwim = 10e3;    units.Wwim = 'g';   label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'nobanis';
  comment.Wwim = 'max weight can be larger';

data.Ri  = 4e6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

data.WJX = [ ... % wet weight (g), food consumption (g/d)
348.489	20.171
351.420	22.411
382.771	21.965
498.601	22.197
504.202	29.590
517.107	25.334
526.240	28.247
538.183	34.744
619.872	31.614
651.123	32.288
722.688	37.333
734.992	39.798
747.947	34.983
750.537	41.031
781.667	43.049
784.277	48.873
809.947	41.931
831.925	41.260
872.900	38.239
874.668	53.471
959.228	53.253
968.541	54.150
969.203	46.758
1084.422	53.822
1084.813	49.454
1102.978	56.399
1118.774	54.833
1124.555	60.209
1126.048	43.521
1148.812	69.059
1207.496	43.079
1231.724	52.264
1240.496	59.209
1259.362	58.314
1277.307	67.724
1293.223	64.813
1384.767	56.531
1569.251	59.344
1706.698	62.938];
data.WJX(:,2) = data.WJX(:,2)/3; % convert food per 3 d to food per d as mean
units.WJX   = {'g', 'g/d'};  label.WJX = {'wet weight', 'squid intake'};  
temp.WJX    = C2K(7.4);  units.temp.WJX = 'K'; label.temp.WJX = 'temperature';
bibkey.WJX = 'ZhouShir1998';
comment.WJX = 'food consisted of squid (Loligo opalescent Berry); fed once per 3 days, uneaten food removed at day 2';

% weight-growth
data.WdW_m = [ ... % initial wet weight (g), weight gain in 4 mnth (g/kg)
416.314	585.075
502.119	483.582
527.542	593.035
552.966	417.910
578.390	410.945
581.568	421.891
619.703	457.711
638.771	362.189
657.839	497.512
676.907	348.259
683.263	421.891
756.356	339.303
810.381	493.532
823.093	348.259
870.763	302.488
918.432	477.612
1150.424	304.478
1191.737	323.383
1287.076	338.308
1471.398	307.463];
data.WdW_m(:,2) = data.WdW_m(:,2) .* data.WdW_m(:,1)/ 1e3/ 122; % convert weight gain to g/d
units.WdW_m   = {'g', 'g/d'};  label.WdW_m = {'wet weight', 'growth rate'};  
temp.WdW_m    = C2K(7.4);  units.temp.WdW_m = 'K'; label.temp.WdW_m = 'temperature';
bibkey.WdW_m = 'ZhouShir1998';
comment.WdW_m = 'Data for males that moulted during experiment';

% time-length
% females
data.tL_f = [ ... % time since metam (yr), carapace length (cm)
 2.9  2.96
 3.9  5.02
 4.9  6.40
 5.9  7.14
 6.9  8.35
 7.9  9.23
 3.9  5.27
 4.9  7.19
 5.9  8.35
 6.9  9.74
 7.9 10.53
 8.9 10.93];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since metam', 'carapace length', 'female'};  
temp.tL_f    = C2K(3.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LoheArms2001';
comment.tL_f = 'Data for females for Bristol Bay, Alaska';
% males
data.tL_m = [ ... % time since metam (yr), carapace length (cm)
 2.9  3.19
 3.9  5.07
 4.9  6.32
 5.9  7.01
 6.9  8.84
 3.9  5.41
 4.9  7.34
 5.9  8.65
 6.9 10.42
 7.9 11.78
 8.9 13.65];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since metam', 'carapace length', 'male'};  
temp.tL_m    = C2K(3.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LoheArms2001';
comment.tL_m = 'Data for males for Bristol Bay, Alaska';

%% set weights for all real data
weights = setweights(data, []);
weights.Wdj = 0 * weights.Wdj;
weights.WdW_m = 2 * weights.WdW_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

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
D2 = 'Wdj data ignored, because it seems too low';
metaData.discussion = struct('D1', D1,'D2', D2);

%% Facts
F1 = 'From the ages of 1 to 4 Alaskan king crabs form clusters of up to 500,000 individuals called pods';
metaData.bibkey.F1 = 'ADW'; 
F2 = '4 zoeal stages, 1 glaucothoe stage; Experimental studies have shown that stage I zoeae need salinity above 20 ppt and temperature below 15 C; stage II zoeae required temperatures below 3 C';
metaData.bibkey.F2 = 'nobanis'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = '97935'; % ITIS
metaData.links.id_EoL = '46505309'; % Ency of Life
metaData.links.id_Wiki = 'Paralithodes_camtschaticus'; % Wikipedia
metaData.links.id_ADW = 'Paralithodes_camtschaticus'; % ADW
metaData.links.id_Taxo = '508920'; % Taxonomicon
metaData.links.id_WoRMS = '233889'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Paralithodes_camtschaticus}}';
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
bibkey = 'LoheArms2001'; type = 'Article'; bib = [ ... 
'author = {T. Loher and D. A. Armstrong}, ' ... 
'year = {2001}, ' ...
'title = {Growth of juvenile red king crab (\emph{Paralithodes camtschaticus}) in {B}ristol {B}ay ({A}laska) elucidated from field sampling and analysis of trawl-survey data}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {99}, ' ...
'pages = {572-587}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ZhouShir1998'; type = 'Article'; bib = [ ... 
'author = {S. Zhou and T. C. Shirley and G. H. Kruse}, ' ... 
'year = {1998}, ' ...
'title = {FEEDING AND GROWTH OF THE RED KING CRAB \emph{Paralithodes camtschaticus} UNDER LABORATORY CONDITIONS}, ' ...
'journal = {J. Crust. Biol.}, ' ...
'volume = {18}, ' ...
'pages = {337-345}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/342038/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Paralithodes_camtschaticus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'nobanis'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.nobanis.org/marine-identification-key/crabs--lobsters/identification-key-to-introduced-decapods/identification-key-to-introduced-decapods1/identification-key-to-introduced-decapods/Key/End/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
%
bibkey = 'seagrant'; type = 'Misc'; bib = ...
'howpublished = {\url{https://seagrant.uaf.edu/factsheets/kingcrab/crablifehistory-poster.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
