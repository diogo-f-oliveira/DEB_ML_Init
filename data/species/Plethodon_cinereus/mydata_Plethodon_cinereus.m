function [data, auxData, metaData, txtData, weights] = mydata_Plethodon_cinereus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Plethodontidae';
metaData.species    = 'Plethodon_cinereus'; 
metaData.species_en = 'Red-backed salamander'; 

metaData.ecoCode.climate = {'Cfb', 'Dfa', 'Dwa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFc', 'jiTf'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'; 't-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.ab = 15;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'amphibiaweb';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '6 till 8 weeks (Wiki), female remains coild around eggs during incubation';
data.tp = 730;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 25*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'field body temp 6.5-22 C (amphibiaweb)';

data.Lb  = 1.75;      units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'ADW';
data.Lp  = 5.5;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty '; bibkey.Lp  = 'EoL'; 
  comment.Lp = 'converted from SVL 4.12 cm: 22/13.5*4.12';
data.Lpm  = 6.6;     units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'EoL'; 
  comment.Lpm = 'converted from SVL 4.05 cm: 22/13.5*4.05';
data.Li  = 10;    units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';

data.Wwb = 1.41e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 2.5 to 3.2 mm: pi/6*0.3^3';
data.Wwi = 1.2;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Fara2019';

data.Ri  = 20/365/2; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5 to 120 eggs per clutch, 1 clutch each other yr assumed; value 20 per 2 yr was selected for consistency with LN data';

% univariate data
% length-change in length
data.LdL = [... % total length (cm), change in length (cm/3-month)
2.3064	0.4160
2.4394	0.8159
2.5392	0.3269
2.6348	0.6130
2.7221	0.5379
2.7346	0.6046
2.8260	0.6489
3.2791	-0.0764
3.4080	0.3263
3.5493	0.4039
3.6989	0.5149
3.7904	0.4982
3.8195	0.0454
3.8569	-0.0297
3.9026	0.5509
3.9026	-0.2408
3.9400	0.2481
3.9608	0.2230
3.9733	-0.0047
3.9941	0.1758
4.0606	0.2535
4.1063	-0.0576
4.1603	-0.2966
4.1770	0.0784
4.1977	0.0145
4.2102	-0.2299
4.2102	-0.2633
4.2435	-0.2966
4.2476	0.1784
4.2559	-0.2327
4.2643	0.0895
4.4679	-0.1357
4.4846	0.1365
4.6010	-0.1052
4.6051	0.0253
4.6508	-0.2081
4.6882	-0.5275
4.7631	-0.3415
4.8088	-0.4249];
data.LdL(:,2) = data.LdL(:,2)/ 30.5/6; % convert cm/ 6-month to cm/d
data.LdL = data.LdL * 22/ 13.5; % convert SVL to total length
units.LdL  = {'cm', 'cm/d'}; label.LdL = {'total length', 'change in total length'};  
temp.LdL   = C2K(25); units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'BiddGran2017';
comment.LdL = 'Data for growth in summer; length measurements on average 6 months apart, pers comm. Eric Liebgold. Mean summer temp 24 C, but the analysis assumes that salamanders select cool sites';

% time-length
data.tL_f = [ ... % time since birth (yr), SVL (cm)
1 2.34
2 2.84
3 3.31
4 3.86
5 4.27
6 4.48
7 4.69];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
data.tL_f(:,2) = data.tL_f(:,2) * 22/ 13.5; % convert SVL to total length
units.tL_f  = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(15); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Sayl1966';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), SVL (cm)
1 2.30
2 2.73
3 3.36
4 3.83
5 4.16
6 4.31
7 4.40];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
data.tL_m(:,2) = data.tL_m(:,2) * 22/ 13.5; % convert SVL to total length
units.tL_m  = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(12); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Sayl1966';
comment.tL_m = 'Data for males; mean temp 2.7 C in Jan, 25.7 C in July';

% length-fecundity
data.LN = [ ... % SVL (mm), follicle number (#)
3.422	8.941
3.425	7.096
3.526	2.927
3.527	6.012
3.633	8.980
3.737	4.025
3.737	5.961
3.738	10.013
3.740	7.050
3.747	8.986
3.836	6.963
3.843	11.046
3.945	11.021
3.947	3.944
3.948	8.995
3.950	6.061
3.951	7.029
3.957	8.058
4.052	6.006
4.052	7.004
4.053	8.032
4.053	9.967
4.054	12.991
4.056	9.000
4.158	9.972
4.158	11.000
4.161	7.039
4.161	8.097
4.165	9.065
4.170	6.011
4.262	6.045
4.263	8.041
4.263	9.009
4.263	11.066
4.269	7.044
4.270	12.003
4.273	10.068
4.369	15.062
4.374	5.022
4.374	7.048
4.374	8.016
4.375	9.075
4.375	10.042
4.375	10.980
4.473	6.992
4.480	9.079
4.480	10.077
4.480	11.015
4.480	12.043
4.482	5.995
4.483	8.051
4.579	13.015
4.581	5.032
4.584	5.999
4.584	7.058
4.585	7.995
4.585	11.050
4.588	10.022
4.683	7.062
4.684	12.052
4.684	13.050
4.686	8.000
4.690	9.028
4.692	5.037
4.693	6.065
4.694	11.085
4.788	8.065
4.789	10.001
4.789	11.029
4.793	13.025
4.798	7.068
4.798	9.154
4.894	10.036
4.894	12.062
4.897	8.010
5.012	11.099];
data.LN(:,1) = data.LN(:,1) * 22/ 13.5; % convert SVL to total length
units.LN  = {'cm', '#'}; label.LN = {'total length', '2 yr fecundity'};  
temp.LN   = C2K(18); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Nage1977';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.LdL = 0 * weights.LdL;
weights.Lb = 0 * weights.Lb;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Males slightly smaller than females';
metaData.bibkey.F1 = 'EoL'; 
F2 = 'The larval stage is passed within the egg capsule';
metaData.bibkey.F2 = 'EoL'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'Eric Liebgold kindly helped collecting data for this entry';

%% Links
metaData.links.id_CoL = '6W283'; % Cat of Life
metaData.links.id_ITIS = '173649'; % ITIS
metaData.links.id_EoL = '333692'; % Ency of Life
metaData.links.id_Wiki = 'Plethodon_cinereus'; % Wikipedia
metaData.links.id_ADW = 'Plethodon_cinereus'; % ADW
metaData.links.id_Taxo = '47446'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Plethodon+cinereus'; % AmphibiaWeb
metaData.links.id_AnAge = 'Plethodon_cinereus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Plethodon_cinereus}}';
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
bibkey = 'BiddGran2017'; type = 'Article'; bib = [ ... 
'author = {J. R. Biddle and A. H. Grant and E. B. Liebgold}, ' ... 
'year = {2017}, ' ...
'title = {Factors Affecting the Growth of Eastern Red-backed Salamanders, \emph{Plethodon cinereus}}, ' ...
'journal = {Herpetologica}, ' ...
'volume = {73}, ' ...
'pages = {89-93}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Nage1977'; type = 'Article'; bib = [ ... 
'author = {J. W. Nagel}, ' ... 
'year = {1977}, ' ...
'title = {Life history of the red-backed salamander, \emph{Plethodon cinereus}, in Northeastern {T}ennessee}, ' ...
'journal = {Herpetologica}, ' ...
'volume = {33}, ' ...
'number = {3}, ' ...
'pages = {13-18}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sayl1966'; type = 'Article'; bib = [ ... 
'author = {A. Sayler}, ' ... 
'year = {1966}, ' ...
'title = {The reproduction ecology of the red-backed salamander, \emph{Plethodon cinereus}, in {M}aryland}, ' ...
'journal = {Copeia}, ' ...
'volume = {2}, ' ...
'pages = {183-193}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Plethodon+cinereus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Plethodon_cinereus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/333692/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Plethodon_cinereus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Fara2019'; type = 'Misc'; bib = [...
'author = {Vincent R. Farallo}, ' ...
'institution = {Yale University}, ' ...
'note = {personal communication}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

