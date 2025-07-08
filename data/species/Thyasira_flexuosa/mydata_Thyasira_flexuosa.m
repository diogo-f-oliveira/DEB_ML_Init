function [data, auxData, metaData, txtData, weights] = mydata_Thyasira_flexuosa
  
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Lucinida'; 
metaData.family     = 'Thyasiridae';
metaData.species    = 'Thyasira_flexuosa'; 
metaData.species_en = 'Flexuose cleftclam'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp','biAb'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12);
metaData.data_0     = {'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L', 'L-Wd'}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 04]; 

%% set data

% % zero-variate data

data.am = 3*365;    units.am = 'd';    label.am = 'life span';    bibkey.am = 'LopeGonz1987';   
  temp.am = C2K(6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb  = 0.0185;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
  comment.Lb = 'based on Thyasira_cf_gouldi';
data.Lj  = 0.12;   units.Lj  = 'cm';  label.Lj  = 'shell height at settlment'; bibkey.Lj  = 'LopeGonz1987'; 
data.Lp  = 0.54;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lb = 'based on same relative length, compared  Thyasira_cf_gouldi: 0.99*0.28/0.514'; 
data.Li  = 0.99;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'LopeGonz1987';
  comment.Li = 'Total length measured as shell length (anterior-posterior).';

data.Ri  = 28835/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
temp.Ri = C2K(10);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = 'based on kap = 0.88, as found for Thyasira_cf_gouldi';

% uni-variate data  

% Age-length data
data.tL = [ % time since birth (d), shell height (cm)
50.976	0.134
88.978	0.102
114.278	0.142
173.970	0.202
211.074	0.234
252.087	0.259
276.224	0.322
326.240	0.314
359.214	0.319
507.321	0.398
539.474	0.479
573.667	0.468
599.954	0.458
633.072	0.485
684.858	0.545];
data.tL(:,1) = data.tL(:,1) + 90; % set origen at birth
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'shell height'};  
temp.tL = C2K(6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LopeGonz1987';
comment.tL = 'Data from Ria de La Coruiia, North-west Spain';

% length-weight
data.LWd = [ ... % shell height (cm), AFDW (mg)
0.119	0.008
0.154	0.025
0.182	0.033
0.209	0.100
0.233	0.117
0.267	0.159
0.297	0.251
0.330	0.334
0.358	0.443
0.389	0.577
0.416	0.744
0.443	1.003
0.480	1.070
0.507	1.455
0.539	1.689
0.568	2.241
0.596	2.400
0.624	2.742
0.685	3.043
0.740	4.799];
data.LWd(:,2) = data.LWd(:,2)/1e3; % convert mg to g
units.LWd = {'cm', 'g'}; label.LWd = {'shell height', 'ash-free dry weight'};  
bibkey.LWd = 'LopeGonz1987';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Although LopeGonz1987 mentions settlement, marlin gives that larval development is non-pelagic, suggesting that larvae are brooded inside the shell';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Thyasirids may have sulfur-oxidizing bacterial symbionts. Symbiotic thyasirids are mixotrophs, deriving nutritional input from particulate feeding and from their symbionts.';
metaData.bibkey.F1 = 'DandSpir1993'; 
F2 = 'Thyasira_flexuosa livse 10 cm below the sediment surface, escaping most predation';
metaData.bibkey.F2 = 'LopeGonz1987'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '56PF8'; % Cat of Life
metaData.links.id_ITIS = '80512'; % ITIS
metaData.links.id_EoL = '46472891'; % Ency of Life
metaData.links.id_Wiki = 'Thyasira'; % Wikipedia
metaData.links.id_ADW = 'Thyasira_flexuosa'; % ADW
metaData.links.id_Taxo = '612805'; % Taxonomicon
metaData.links.id_WoRMS = '141662'; % WoRMS
metaData.links.id_molluscabase = '141662'; % molluscabase


%% References

bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thyasira_flexuosa}},'...
'note = {Accessed : 2017-04-30}'];
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
bibkey = 'LopeGonz1987'; type = 'Article'; bib = [ ...
'author = {Eduardo L\''{o}pez-Jamar and Gloria Gonz\''{a}lez and Jaime Mejuto},'...
'title = {ECOLOGY, GROWTH AND PRODUCTION OF \emph{Thyasira_flexuosa} ({B}IVALVIA, {L}UCINACEA) FROM {R}iA DE LA {C}ORUNA, {N}ORTH-{W}EST {S}PAIN}, '...
'journal = {Ophelia}, '...
'volume = {27(2)}, ' ...
'pages = {111-126}, '...
'year = {1987}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DandSpir1993'; type = 'Article'; bib = [ ...
'author={Dando, P. R. and Spiro, B.},'...
'title={Varying nutritional dependence of the thyasirid bivalves \emph{Thyasira sarsi} and \emph{T. equalis} on chemoautotrophic symbiotic bacteria, demonstrated by isotope ratios of tissue carbon and shell carbonate}, '...
'journal={Marine Ecology Progress Series}, '...
'pages={151--158},'...
'publisher={JSTOR},'...
'year={1993}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'marlin'; type = 'Misc'; bib = [...
'howpublished = {\url{http://www.marlin.ac.uk/biotic/browse.php?sp=6021}},'...
'note = {Accessed : 2017-04-30}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
