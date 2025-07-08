function [data, auxData, metaData, txtData, weights] = mydata_Zygochlamys_patagonica

%% set metaData
metaData.phylum     = 'Mollusca';
metaData.class      = 'Bivalvia';
metaData.order      = 'Pectinida';
metaData.family     = 'Pectinidae';
metaData.species    = 'Zygochlamys_patagonica';
metaData.species_en = 'Patagonian scallop';

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(7);

metaData.data_0     = {'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'};
metaData.data_1     = {'t-L_f'; 't-Ww_f'; 't-WwR_f'};

metaData.COMPLETE = 2.5;

metaData.author      = {'Bas Kooijman'};
metaData.date_subm   = [2019 01 04]; 
metaData.email       = {'bas.kooijman@vu.nl'}; 
metaData.address     = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 04]; 

%% Set zero-variate data;
data.tp   = 365 * 3; units.tp      = 'd'; label.tp      = 'time since birth at puberty';    bibkey.tp = 'LomoLast2008';
  temp.tp = C2K(7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am   = 365 * 21; units.am      = 'd'; label.am      = 'life span';            bibkey.am = 'LomoLast2008';
  temp.am = C2K(7);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lj = 0.06;  units.Lj = 'cm'; label.Lj = 'shell length at metamorphosis'; bibkey.Lj = 'guess';
data.Li = 7;     units.Li = 'cm'; label.Li = 'ultimate shell length';         bibkey.Li = 'LomoLast2008';

data.Wwb = 4.2e-6; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 200 mum: pi/6*0.02^3';

%% Set uni-variate data
%time-length data
data.tL1 = [ ... % time since birth (yr), shell height (cm)
0.950	2.710
1.007	1.312
2.014	3.237
2.993	4.055
4.978	5.792
5.986	6.661
5.986	6.439
5.986	6.251
5.986	5.416
6.043	5.348
6.964	7.171
6.993	6.847
6.993	6.933
7.885	6.847
8.921	6.744
8.950	6.812
8.978	6.096
9.957	7.680
9.986	6.947
10.014	6.470
10.043	5.993
10.935	6.521
10.935	6.418
10.935	6.265
11.942	5.634
11.942	6.128
11.971	6.503
12.000	6.605
12.000	6.895
12.978	6.843
13.007	6.178
13.007	5.906
13.986	5.717
13.986	6.092
13.986	6.195
14.993	7.012
14.993	7.080
15.971	5.955
16.000	6.824
16.950	6.312
20.950	5.849]; 
data.tL1(:,1) = 365 * data.tL1(:,1); % convert yr to d
units.tL1 = {'d', 'cm'}; label.tL1 = {'time since birth', 'shell height', 'Beagle, 112 m'};
temp.tL1 = C2K(7); units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
comment.tL1 = 'Growth in bed Beagle at 112 m: temp from 5.7 to 8.5 C seasonally '; 
bibkey.tL1 = 'LomoLast2008';
%
data.tL2 = [ ... % time since birth (yr), shell height (cm)
0.978	2.795
0.978	2.999
1.007	2.420
1.007	2.590
1.928	3.271
1.928	3.340
1.957	3.595
1.957	3.663
2.906	3.390
2.935	4.089
2.964	3.543
2.993	3.611
2.993	3.731
2.993	3.918
3.914	4.020
3.914	4.156
3.942	3.815
4.029	4.378
4.950	4.360
4.978	4.650
4.978	4.752
4.978	4.923
5.007	4.070
5.986	4.666
5.986	4.803
6.014	4.393
6.014	4.479
6.014	4.973
6.014	5.126
6.935	4.887
6.935	4.955
6.935	5.041
6.935	5.194
7.022	5.313
8.000	4.955
8.000	5.653
8.000	6.131
8.029	5.108
8.029	5.244
8.029	5.330
8.029	5.500
8.921	5.090
8.950	5.431
8.978	5.840
9.065	6.215
9.065	6.351
10.014	5.499
10.014	6.334
10.878	6.265
10.964	6.129
13.094	5.991]; 
data.tL2(:,1) = 365 * data.tL2(:,1); % convert yr to d
units.tL2 = {'d', 'cm'}; label.tL2 = {'time since birth', 'shell height', 'Uruguay, 108 m'};
temp.tL2 = C2K(8.2); units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
comment.tL2 = 'Growth in bed Uruguay at 108 m; temp from 7.5 to 8.8 C seasonally'; 
bibkey.tL2 = 'LomoLast2008';

% time-shell-free wet weight
data.tW1 = data.tL1; data.tW1(:,2) = exp(-10.49 + 3.18 * log(10 * data.tW1(:,2))); % g, shell-free wet weight
units.tW1 = {'d', 'g'}; label.tW1 = {'time since birth', 'shell-free wet weight', 'Beagle, 112 m'};
temp.tW1 = C2K(7); units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
comment.tW1 = 'Growth in bed Beagle at 112 m: temp from 5.7 to 8.5 C seasonally; length-weight conversion based on F2'; bibkey.tW1 = 'LomoLast2008';
%
data.tW2 = data.tL2; data.tW2(:,2) = exp(-11.69 + 3.39 * log(10 * data.tW2(:,2))); % g, shell-free wet weight
units.tW2 = {'d', 'g'}; label.tW2 = {'time since birth', 'shell-free wet weight', 'Uruguay108', };
temp.tW2 = C2K(8.2); units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
comment.tW2 = 'Growth in bed Uruguay at 108 m; temp from 7.5 to 8.8 C seasonally; length-weight conversion based on F1'; bibkey.tW2 = 'LomoLast2008';

% time-gonadal wet weight
data.tWR1 = data.tL1; data.tWR1(:,2) = (data.tWR1(:,1) > data.tp) .* exp(-12.35 + 2.94 * log(10 * data.tWR1(:,2))); % g, gonadal wet weight
units.tWR1 = {'d', 'g'}; label.tWR1 = {'time since birth', 'gonadal wet weight', 'Beagle, m'};
temp.tWR1 = C2K(7); units.temp.tWR1 = 'K'; label.temp.tWR1 = 'temperature';
comment.tWR1 = 'Growth in bed Beagle at 112 m: temp from 5.7 to 8.5 C seasonally; length-gonadal weight conversion based on F4'; bibkey.tWR1 = 'LomoLast2008';
%
data.tWR2 = data.tL2; data.tWR2(:,2) = (data.tWR2(:,1) > data.tp) .* exp(-19.84 + 4.54 * log(10 * data.tWR2(:,2))); % g,  gonadal wet weight
units.tWR2 = {'d', 'g'}; label.tWR2 = {'time since birth', 'gonadal wet weight', 'Uruguay,108 m'};
temp.tWR2 = C2K(8.2); units.temp.tWR2 = 'K'; label.temp.tWR2 = 'temperature';
comment.tWR2 = 'Growth in bed Uruguay at 108 m; temp from 7.5 to 8.8 C seasonally; length-gonadal weight conversion based on F3'; bibkey.tWR2 = 'LomoLast2008';

%% Set weights for all real data
weights = setweights(data, []);
weights.tL1 = 5 * weights.tL1;
weights.tL2 = 5 * weights.tL2;
%weights.tp = 0 * weights.tp;

%% Set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% Pack auxData and txtData for output
auxData.temp    = temp;
txtData.units   = units;
txtData.label   = label;
txtData.bibkey  = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL1','tL2'}; subtitle1 = {'Data from bed Beagle, Uruguay'};
set2 = {'tW1','tW2'}; subtitle2 = {'Data from bed Beagle, Uruguay'};
set3 = {'tWR1','tWR2'}; subtitle3 = {'Data from bed Beagle, Uruguay'};
metaData.grp.sets    = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Facts
F1 = 'height-weight Uruguay: log(shell-free wet mass in g) = ?11.69 + 3.39 * log(shell height in mm)';
metaData.bibkey.F1 = 'LomoLast2008'; 
F2 = 'height-weight Beagle: log(shell-free wet mass in g) = ?10.49 + 3.18 * log(shell height in mm)';
metaData.bibkey.F2 = 'LomoLast2008'; 
F3 = 'height-gonad mass Urugay: log(gonadal wet mass in g) = ?19.84 + 4.54 * log(shell height in mm)';
metaData.bibkey.F3 = 'LomoLast2008'; 
F4 = 'height-gonad mass Beagle: log(gonadal wet mass in g) = ?12.35 + 2.94 * log(shell height in mm)';
metaData.bibkey.F4 = 'LomoLast2008'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = '7GGX7'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46467774'; % Ency of Life
metaData.links.id_Wiki = 'Zygochlamys'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3991914'; % Taxonomicon
metaData.links.id_WoRMS = '236717'; % WoRMS
metaData.links.id_molluscabase = '236717'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Zygochlamys}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LomoLast2008'; type = 'Article'; bib = [ ...
'author = {Betina J. Lomovasky and Mario Lasta and Macarena Valinas and Mart\''{i}n Bruschetti and Pablo Ribeiro and, Silvana Campod\''{o}nico and Oscar Iribarne}, ' ...
'year = {2008}, ' ...
'title = {Differences in shell morphology and internal growth pattern of the {P}atagonian scallop \emph{Zygochlamys patagonica} in the four main beds across their {S}{W} {A}tlantic distribution range}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {89}, ' ...
'pages = {266-275}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
