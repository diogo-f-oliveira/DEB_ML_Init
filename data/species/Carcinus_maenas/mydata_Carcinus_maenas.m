function [data, auxData, metaData, txtData, weights] = mydata_Carcinus_maenas

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Portunidae';
metaData.species    = 'Carcinus_maenas'; 
metaData.species_en = 'Shorecrab'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE', 'MANW', 'MPE', 'MIW'};
metaData.ecoCode.habitat = {'0bMcb', 'bjMp', 'jiMcb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'biD', 'jiCi', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'aj_T', 'ap', 'am', 'Lp', 'Li', 'Wwi', 'Ri'}; 
metaData.data_1     = {'t-L', 't-WC_T', 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 02 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 02 09]; 

%% set data
% zero-variate data

data.tj_12 = 80;  units.tj_12 = 'd'; label.tj_12 = 'time since birth at metam'; bibkey.tj_12 = 'exoticsguide';   
  temp.tj_12 = C2K(12); units.temp.tj_12 = 'K'; label.temp.tj_12 = 'temperature';
  comment.tj_12 = 'corresponds with end megalope stage';
data.tj_25 = 17;  units.tj_25 = 'd'; label.tj_25 = 'time since birth at metam'; bibkey.tj_25 = 'exoticsguide';   
  temp.tj_25 = C2K(25); units.temp.tj_25 = 'K'; label.temp.tj_25 = 'temperature';
data.tp = 250;  units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'ADW';
  temp.tp = C2K(15);    units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'exoticsguide gives <1 - 3 yr, depending on temp; 250 d is read from tL-curve for Lp';
data.am = 6*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'exoticsguide';   
  temp.am = C2K(15);   units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'exoticsguide gives 3-6 yr';
  
data.Lp  = 3.3;   units.Lp  = 'cm';  label.Lp  = 'carapace width at puberty';   bibkey.Lp  = 'BehrDumb2005';
data.Li  = 6;     units.Li  = 'cm';  label.Li  = 'ultimate carapace width for females'; bibkey.Li  = 'BehrDumb2005';
data.Lim  = 7.5;  units.Lim = 'cm';  label.Lim  = 'ultimate carapace width for males';  bibkey.Lim  = 'BehrDumb2005';
  comment.Lim = 'Data for Baltic/Germany; males can reach 10 cm, usgs';

data.Wwi = 149;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';         bibkey.Wwi = {'glaucus','BehrDumb2005'};

data.Ri  = 2e5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'exoticsguide';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Temp is guessed';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (yr), carapace width (cm)
0.475	1.392
0.524	1.920
0.539	2.806
0.574	3.143
0.574	3.397
0.534	3.671
0.649	3.186
0.624	3.840
0.628	4.198
0.628	4.241
0.708	4.620
0.703	4.662
0.958	4.599
1.294	4.789
1.253	5.295
1.443	5.759
1.623	5.823
1.598	6.392
1.553	6.793
1.608	6.962
1.508	7.363
1.838	6.308
2.364	5.443
2.359	6.730
2.313	7.194
2.438	7.532
2.554	6.034
2.633	7.468
2.648	7.722
2.693	7.679
2.774	7.553
3.284	8.122
3.389	7.975
3.424	8.418
3.549	8.776
3.619	8.017
3.614	7.932
3.614	7.173
3.779	8.565
4.445	6.624
4.464	8.797
4.494	8.966
5.455	8.903
5.495	8.966
5.500	9.135
5.680	8.903]; 
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'carapace width'};  
temp.tL    = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BehrDumb2005';
  
data.tWC_18 = [... % time since hatch (d), carbon weight (mug)
0       2.87    % egg
4.295	6.173   % Zoea I
7.840	14.321  % Zoea II
11.994	22.469  % Zoea III
17.947	39.506  % Zoea IV
26.277	60.000];% Megalopa
units.tWC_18   = {'d', 'mug'};  label.tWC_18 = {'time since birth', 'carbon weight', '18 C'};  
temp.tWC_18    = C2K(18);  units.temp.tWC_18 = 'K'; label.temp.tWC_18 = 'temperature';
bibkey.tWC_18 = 'DawiPusc1986';
comment.tWC_18 = 'Max values for 5 stages; before and after maxima, weight is less due to absence of feeding around moulting';
%
data.tWC_12 = [... % time since hatch (d), carbon weight (mug)
0       2.87    % egg
7.799	6.667   % Zoea I
15.056	11.728  % Zoea II
24.391	20.988  % Zoea III
31.451	31.728  % Zoea IV
48.984	65.185];% Megalopa
units.tWC_12   = {'d', 'mug'};  label.tWC_12 = {'time since birth', 'carbon weight', '12 C'};  
temp.tWC_12    = C2K(12);  units.temp.tWC_12 = 'K'; label.temp.tWC_12 = 'temperature';
bibkey.tWC_12 = 'DawiPusc1986';
comment.tWC_12 = 'Max values for 5 stages; before and after maxima, weight is less due to absence of feeding around moulting';

data.LW = [ ... % carapace width (cm), wet weight (g)
1.999	2.986
2.497	5.162
2.607	6.111
2.903	6.136
3.088	8.115
3.316	8.902
3.493	10.027
3.493	11.051
3.603	10.975
3.696	10.898
3.696	11.751
3.695	12.946
3.719	15.253
3.899	9.976
3.823	9.970
3.806	10.822
3.805	11.846
3.805	13.041
3.805	14.065
3.932	12.966
3.897	15.182
4.008	13.997
4.085	11.187
4.101	14.090
4.100	16.224
4.015	16.217
4.091	16.906
4.090	18.015
4.243	16.919
4.215	22.891
4.311	15.644
4.403	20.176
4.403	19.152
4.513	19.929
4.513	18.478
4.614	21.218
4.596	21.985
4.529	21.979
4.595	25.057
4.589	19.167
4.699	19.006
4.699	18.409
4.767	18.927
4.775	19.866
4.918	21.073
4.994	22.787
5.018	25.264
4.782	24.305
4.891	25.082
4.789	25.842
4.789	26.695
5.008	29.445
5.211	28.011
5.295	31.176
5.405	31.015
5.218	32.109
5.217	33.986
5.412	34.942
5.513	35.207
5.512	38.108
5.519	40.157
5.613	38.032
5.588	37.091
5.741	37.018
5.808	38.219
5.714	40.515
5.812	48.376
6.015	48.308
6.015	47.284
6.200	51.140
6.215	55.494
6.518	60.214
6.516	65.164];
units.LW   = {'cm', 'g'};  label.LW = {'carapace width', 'wet weight'};  
bibkey.LW = 'MuncSpar1982';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.LW = 10 * weights.LW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWC_18','tWC_12'}; subtitle1 = {'Data for 18, 12 C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'C. maenas has a planktontic zoea stage, for by a planktontic megalopae stage and a bentic juvinle/adult stage';
metaData.bibkey.F1 = 'ADW'; 
F2 = 'Migrates yearly to deeper waters for spawning; copulation is directly after moulting; females carry eggs for several months';
metaData.bibkey.F2 = 'ADW'; 
F3 = 'crabs donot feed when tempertures drop below 7 C, and cannot molt in temperatures below 10 C';
metaData.bibkey.F3 = {'exoticsguide','BehrDumb2005'}; 
F4 = 'Sexual maturity at moult 11 or 12';
metaData.bibkey.F4 = {'BehrDumb2005'}; 
F5 = 'there is no indication of a terminal instar in C. maenas,';
metaData.bibkey.F5 = {'BehrDumb2005'}; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4,'F5',F5);

%% Links
metaData.links.id_CoL = 'R48N'; % Cat of Life
metaData.links.id_ITIS = '98734'; % ITIS
metaData.links.id_EoL = '46508863'; % Ency of Life
metaData.links.id_Wiki = 'Carcinus_maenas'; % Wikipedia
metaData.links.id_ADW = 'Carcinus_maenas'; % ADW
metaData.links.id_Taxo = '34023'; % Taxonomicon
metaData.links.id_WoRMS = '107381'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Carcinus_maenas}}';
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
bibkey = 'BehrDumb2005'; type = 'Article'; bib = [ ... 
'author = {S. Behrens Yamada and B. R. Dumbauld and A. Kalin and C. E. Hunt and R. Figlar-Barnes and A. Randall}, ' ... 
'year = {2005}, ' ...
'title = {Growth and persistence of a recent invader \emph{Carcinus maenas} in estuaries of the northeastern {P}acific}, ' ...
'journal = {Biological Invasions}, ' ...
'volume = {7}, ' ...
'pages = {309-321}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DawiPusc1986'; type = 'Article'; bib = [ ... 
'author = {Dawirs, R. R.}, ' ... 
'year = {1986}, ' ...
'title = {Temperature and growth in \emph{Carcinus maenas} {L}. ({D}ecapoda: {P}ortunidae) larvae ready in the laboratory from hatching through metamorphosis}, ' ...
'journal = {J. Exp. Mar. Biol. Ecol.}, ' ...
'volume = {100}, ' ...
'pages = {47--74}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MuncSpar1982'; type = 'Article'; bib = [ ... 
'author = {Munch-Petersen, S. and Sparre, P. and Hoffmann, E.}, ' ... 
'year = {1982}, ' ...
'title = {Abundance of the shore crab, \emph{Carcinus maenas} {L}., estimated from mark-recapture experiments}, ' ...
'journal = {Dana}, ' ...
'volume = {2}, ' ...
'pages = {97--121}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Carcinus_maenas/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'exoticsguide'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.exoticsguide.org/carcinus_maenas}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'usgs'; type = 'Misc'; bib = ...
'howpublished = {\url{http://nas.er.usgs.gov/queries/factsheet.aspx?SpeciesID=190}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'glaucus'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.glaucus.org.uk/c-maenas.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

