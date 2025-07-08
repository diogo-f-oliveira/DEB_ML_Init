function [data, auxData, metaData, txtData, weights] = mydata_Anolis_carolinensis
%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Dactyloidae';
metaData.species    = 'Anolis_carolinensis';
metaData.species_en = 'Green anole';

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTg','0iTd'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data;
data.ab = 42;  units.ab = 'd';      label.ab = 'age at birth';             bibkey.ab = 'AnAge';
temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7.2*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'AnAge';
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 2.4;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth';   bibkey.Lb  = 'Mich1972';
data.Lp  = 4.75;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';   bibkey.Lp  = 'Mich1972';
  comment.Lp = '4.5-5 cm';
data.Lpm  = 6.0;  units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males';   bibkey.Lpm  = 'Mich1972';
data.Li  = 6.5;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'Mich1972';
data.Lim = 7.3;  units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'Mich1972';

data.Wwb = 0.26; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwim = 'based on Anolis acutus: 0.21-0.30 g';
data.Wwi = 4.44; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Anolis_acutus and Li: (5.4/4.4)^3*2.4';
data.Wwim = 6.3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'guess';
  comment.Wwi = 'based on Anolis_acutus and Li: (5.4/4.4)^3*2.4';

data.Ri  = 12/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'EoL';
temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs perlitter, 6 litters per yr';

% uni-variate data
% time-length
data.tL_f = [... % time (d), SVL (cm)
0.000	2.788
26.002	2.998
61.523	3.275
90.669	3.618
122.205	3.841
157.635	4.065
244.337	3.917
273.026	3.996
303.538	4.378
332.227	4.457
359.618	4.535
393.476	4.600
425.149	4.903
460.213	4.915
489.062	5.086
613.697	5.109
641.134	5.214
668.365	5.200
700.925	5.265
732.301	5.396
763.540	5.448
790.839	5.474
820.643	5.447];
data.tL_f(:,1) = data.tL_f(:,1)+36; % convert time to time since birth
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(27);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Mich1972'; 
%
data.tL_m = [... % time (d), SVL (cm)
245.343	4.499
271.482	4.604
300.651	4.960
330.615	5.025
360.670	5.143
391.932	5.208
423.354	5.366
454.593	5.418
485.855	5.483
614.520	5.585
641.980	5.703
669.211	5.689
701.748	5.741
737.063	5.899
764.454	5.977
787.952	6.056
821.832	6.134
854.415	6.212
1002.593	6.340
1033.787	6.366
1065.071	6.444
1089.867	6.523];
data.tL_m(:,1) = data.tL_m(:,1)+36; % convert time to time since birth
units.tL_m  = {'cm', 'cm/d'};  label.tL_m = {'SVL', 'change in SVL', 'male'};  
temp.tL_m   = C2K(27);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Mich1972'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Lb = 5 * weights.Lb;

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
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '675MJ'; % Cat of Life
metaData.links.id_ITIS = '173885'; % ITIS
metaData.links.id_EoL = '795869'; % Ency of Life
metaData.links.id_Wiki = 'Anolis_carolinensis'; % Wikipedia
metaData.links.id_ADW = 'Anolis_carolinensis'; % ADW
metaData.links.id_Taxo = '49108'; % Taxonomicon
metaData.links.id_WoRMS = '1485220'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Anolis&species=carolinensis'; % ReptileDB
metaData.links.id_AnAge = 'Anolis_carolinensis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anolis_carolinensis}}';   
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
bibkey = 'Mich1972'; type = 'Article'; bib = [ ...  
'author = {Edwin D. Michael}, ' ...
'title = {Growth Rates in \emph{Anolis carolinensis}}, ' ...
'journal = {Copeia}, ' ...
'volume = {1972(3)}, ' ...
'pages = {575-577}, ' ...
'year = {1972}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Anolis_carolinensis}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/795869}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
