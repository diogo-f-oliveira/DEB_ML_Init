function [data, auxData, metaData, txtData, weights] = mydata_Habrophlebia_lauta

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Ephemeroptera'; 
metaData.family     = 'Leptophlebiidae';
metaData.species    = 'Habrophlebia_lauta'; % 
metaData.species_en = 'Eaton''s Dun'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0eFl', '0eFp', '0eFm', 'eiTg'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'beH', 'beD', 'beS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'ab'; 'aj' ;'am'; 'L0'; 'Lb'; 'Lj'; 'Li'; 'Wdj'; 'Ni'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'; 'L-Wd'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author   = {'Andre Gergs', 'Kim Rakel', 'Kristin Katrin Weiss'};                            
metaData.date_subm = [2017 08 03];                              
metaData.email    = {'gergs@gaiac.rwth-aachen.de'};            
metaData.address  = {'gaiac - Research Institute for Ecosystem Analysis and Assessment, 52072 Aachen, Germany'}; 

metaData.author_mod_1   = {'Andre Gergs','Kim Rakel', 'Kristin Katrin Weiss'};                            
metaData.date_mod_1     = [2018 03 05];                              
metaData.email_mod_1    = {'gergs@gaiac.rwth-aachen.de'};            
metaData.address_mod_1  = {'gaiac - Research Institute for Ecosystem Analysis and Assessment, 52072 Aachen, Germany'}; 

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2018 03 06]; 


%% set data
% zero-variate data;  
data.ab = 18;      units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'Land1957';
 temp.ab = C2K(17);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temperature guessed for July-August';    
    
data.aj = 363;     units.aj = 'd';    label.aj = 'time since birth at emergence';     bibkey.aj = 'BaueSold2012';   
  temp.aj = C2K(10);  units.temp.aj = 'K'; label.temp.aj = 'temperature';
   comment.aj = 'life span - an guessed adult survival 2 days, temperature guessed'; 
   
data.am = 2;     units.am = 'd';    label.am = 'life span as (sub)adult';     bibkey.am = 'BaueSold2012';
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature, average yearly temperature';  
   comment.am = 'univoltine life cycle of H. lauta leads to the assumption of a life span of 365 days, temperature guessed';

data.L0  = 0.0211;   units.L0  = 'cm';   label.L0  = 'egg length';     bibkey.L0  = 'Degr1960';    
data.Lb = 0.01; units.Lb  = 'cm';   label.Lb  = 'length at hatching';     bibkey.Lb  = 'Thib1971';    
data.Lj  = 0.75;   units.Lj  = 'cm';   label.Lj  = 'ultimate length larvae';  bibkey.Lj  = 'Land1957';
data.Li  = 0.8;   units.Li  = 'cm';   label.Li  = 'ultimate forewing length';    bibkey.Li  = 'BaueSold2012';

data.Wdj = 0.00102;   units.Wdj = 'g';    label.Wdj = 'maximum dry weight of nymph';       bibkey.Wdj = 'Beck2011';

data.Ni = 790;   units.Ni = '#';    label.Ni = 'total number of eggs';             bibkey.Ni = 'Degr1960';   
   temp.Ni = C2K(10);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
   comment.Ni = 'temperature guessed';

% uni-variate data 

% t-L data
data.tL = [ ... % time (d), length (cm)
0.00	0.1176
31.00	0.1353
59.00	0.1647
90.00	0.1941
120.00	0.2588
151.00	0.2765
181.00	0.3294
212.00	0.3588
243.00	0.4];
units.tL   = {'d', 'cm'};  label.tL = {'time since start of experiment', 'length'};  
temp.tL    = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Thib1971';
comment.tL = 'monthly measures January - September 1965, field data, temperature guessed';


% body length - dry weight   
data.LW = [ ... % body length (cm), dry weights (g)
0.243	0.296	0.313	0.315	0.315	0.326	0.328	0.33	0.343	0.348	0.361	0.367	0.367	0.37	0.372	0.374	0.374	0.376	0.389	0.389	0.389	0.396	0.398	0.398	0.417	0.426	0.428	0.435	0.435	0.437	0.437	0.441	0.441	0.443	0.45	0.463	0.465	0.478	0.483	0.483	0.491	0.498	0.498	0.5	0.502	0.502	0.502	0.511	0.52	0.528	0.535	0.535	0.537	0.557	0.559	0.576	0.589	0.591	0.593	0.593	0.596	0.598	0.598	0.602	0.607	0.622	0.622	0.626	0.626	0.628	0.639	0.641	0.641	0.654	0.663	0.678	0.685	0.691	0.702	0.733
0.00003	0.00006	0.00008	0.00006	0.00008	0.00007	0.00006	0.00008	0.00016	0.00013	0.00013	0.00013	0.00018	0.00012	0.00015	0.00015	0.00013	0.00017	0.00015	0.0001	0.00012	0.00027	0.00015	0.0001	0.00018	0.00024	0.00025	0.00022	0.00015	0.00025	0.00016	0.00023	0.00035	0.00025	0.00017	0.00025	0.00022	0.00029	0.00036	0.00049	0.00052	0.00028	0.0004	0.00031	0.00027	0.00036	0.00031	0.00042	0.00036	0.00036	0.00035	0.00045	0.00039	0.00056	0.0004	0.00086	0.00039	0.00053	0.00044	0.00058	0.00059	0.00059	0.00045	0.00056	0.00056	0.00062	0.00062	0.00079	0.00061	0.00076	0.00073	0.00109	0.00096	0.00103	0.00086	0.00075	0.00101	0.00086	0.00072	0.00077
]';
units.LW = {'cm', 'g'};     label.LW = {'body length', 'dry weights'};  
temp.LW  = C2K(10);  units.temp.LW = 'K'; label.temp.LW = 'temperature'; bibkey.LW = 'Beck2011'; 
[Y,I]=sort(data.LW(:,1)); data.LW=data.LW(I,:); % sort rows


%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Acknowledgment
metaData.acknowledgment = 'This entry was financially supported by the CEFIC Long-range Research Initiative (project number ECO28)';

%% Links
metaData.links.id_CoL = '6KWL2'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '3683937'; % Ency of Life
metaData.links.id_Wiki = 'Habrophlebia'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '661073'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS


%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Baetis}},'...
'note = {Accessed : 2017-03-31}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Degr1960'; type = 'Article'; bib = [ ...  
'author = {Degrange, C.},'...
'year = {1960},'...
'title = {Recherches sur la Reproduction des {E}phemeropteres},'...
'journal = {Travaux du Labotoire d''Hydrobiologie et de Pisciculture},'...
'volume = {50/51},'...
'pages = {7-193},'...
'howpublished = {\url{}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'Beck2011'; type = 'Misc'; bib = [ ...  
'author = {Becker, D.},'...
'year = {2011},'...
'conference = {SETAC Europe Annual Meeting, Milan, Italy}, ' ...
'title = {Sensitivity distinctions of lotic insect larvae exposed to imidacloprid},'...
'pages = {125},'...
'volume = {21},'...
'howpublished = {\url{http://gaiac-eco.de/pdfs/Becker_et_al-Sensitivity_lotic_insect_larvae_SETAC_Europe_Milano_2011.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'BaueSold2012'; type = 'book'; bib = [ ...  
'author = {Bauernfeind, E. and Soldan, T.},'...
'publisher = {Apollo Books},'...
'year = {2012},'...
'title = {The Mayflies of Europe (Ephemeroptera)},'...
'pages = {319},'...
'ISBN = {978-87-88757-45-3},'...
'howpublished = {\url{}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'Thib1971'; type = 'Article'; bib = [ ...  
'author = {Thibault, M.},'...
'year = {1971},'...
'title = {Le Development des {E}phemeropteres dun ruisseau a truites des {P}yrenees-{A}tlantiques, le {L}issuraga},'...
'journal = {Annales de Limnologie},'...
'volume = {7},'...
'number = {1},'...
'pages = {53--120},'...
'doi = {10.1051/limn/1971011}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'Land1957'; type = 'Article'; bib = [ ...  
'author = {Landa, V.},'...
'year = {1957},'...
'title = {Contribution to the Distribution, Systematic, Development and Ecology of \emph{Habrophlebia fusca} ({C}URT.) and \emph{Habrophlebia lauta} {M}{C} {L}ACHL. ({E}phemeroptera).},'...
'journal = {Acta Societatis Entomologicae Cechosloveniae},'...
'volume = {54}, '...
'number = {2}, '...
'pages = {148--156}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

