function [data, auxData, metaData, txtData, weights] = mydata_Beroe_gracilis

%% set metaData
metaData.phylum     = 'Ctenophora'; 
metaData.class      = 'Nuda'; 
metaData.order      = 'Beroida'; 
metaData.family     = 'Beroidae';
metaData.species    = 'Beroe_gracilis'; 
metaData.species_en = 'Melon comb jelly'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCin'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'T-JO'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine'};    
metaData.date_subm = [2013 06 20];              
metaData.email    = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva AS, Fram Centre, P.O. Box 6606 Langnes, 9296 Tromso, Norway'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2015 11 04];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 11 06]; 


%% set data
% zero-variate data

data.ab = 36/24;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Grev1970';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'eggs hatch after 24 - 48 h';
data.tp = 20.9;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Grev1970';   
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 365/2;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Grev1970';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.035; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Grev1975';
data.Lp  = 1;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Grev1970';
data.Li  = 3.4;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Walr2011';
  comment.Li = 'Grev1970: 3 cm';

data.Wwi = 2;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'estimated based on 1,35 g for a 2.3 cm individual';
  
% uni-variate data

%Length growth of Grev1970
% tL length growth of fastest growing individual in Grev1970, other series was for 3 individuals combined, not used here.
% 15 - 18 C 
data.tL = [ ... %time since hatch, d length, mm
1.154	1.106 ; 3.077	1.066; 10.096	2.013; 17.212	5.098;
20.865	13.11; 28.654	17.072; 33.75	18.021];
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(16.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Grev1970';
comment.tL = 'Food was Pleurobrachia pileus, feeding regime not mentioned in paper';

% dioxygen consumption per g wet weight at different temperatures,
% adjustment time between temperatures 2-6 h
data.TJO = [... %temperature, C	ogygen concumption, mul_O2_g-1_hr-1
7.948	20.723; 7.953	24.173; 11.977	36.358; 11.923	44.547; 16.004	59.477;
15.978	67.941;19.939	98.005];
units.TJO   = {'C', 'mul_O2/h.g'};  label.TJO = {'temperature', 'spec O_2 consumption'};  
bibkey.TJO = 'GyllGrev1979';
comment.TJO = 'mean wet weight of the 7 individuals used in the study was 0.300 g';

% Length - fresh wet weight from van Walraven 2011 SI sampling  caught in western Wadden Sea 
data.LWw1 = [... %length, mm	wet_mass, g
17	0.31;34	0.71;27	1.03;26	0.83;32	0.38;23	0.28;22	0.57;
23	0.65;17	0.66;21	0.85;27	0.57;23	0.48;19	0.30;22	0.41;
20	0.39;23	0.53;15	0.26;14	0.25;22	0.39;19	0.53;17	0.50;
22	0.78;23	0.80;14	0.40;];
data.LWw1(:,1) = data.LWw1(:,1)/10; % convert mm to cm
units.LWw1   = {'cm', 'g'};  label.LWw1 = {'length', 'wet weight'};  
bibkey.LWw1 = 'Walr2011';

% Length - fresh wet weight from van Walraven 2009 TCA fixation exp. as
% described in WalrLang2013 appendix. Caught in western Wadden Sea 7-5-2009
data.LWw2 = [... %length,mm wet mass, g
20	0.97;18	0.57;23	1.35;12	0.13; 21 0.99;13 0.25;16 0.66;22 1.02; 21 0.89;
17	0.56;19	0.83;12	0.21;26	1.19; 17 0.72;12 0.27;19 0.59;17 0.69;17 0.64; 22 1.03;20 0.55];
data.LWw2(:,1) = data.LWw2(:,1)/10; % convert mm to cm
units.LWw2   = {'cm', 'g'};  label.LWw2 = {'length', 'wet weight'};  
bibkey.LWw2 = 'WalrLang2013';

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

%% Group plots
set1 = {'LWw1','LWw2'}; subtitle1 = {'Data from Walr2011, WalrLang2013'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Chemical pars are assumped to relate to ash-free dry mass; MaleFaga1993 report ash free dry mass over dry mass ratio of 0.263 - 0.297 with mean 0.279, which makes del_W = 3.5842';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Hermaphrodite';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Feeds on ctenophores';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '5WK5L'; % Cat of Life
metaData.links.id_ITIS = '659785'; % ITIS
metaData.links.id_EoL = '45502753'; % Ency of Life
metaData.links.id_Wiki = 'Beroe'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '167446'; % Taxonomicon
metaData.links.id_WoRMS = '106361'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Beroe_(ctenophore)}}';
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
bibkey = 'Grev1970'; type = 'Article'; bib = [ ... 
'author = {Greve, W.}, ' ... 
'year = {1970}, ' ...
'title = {Cultivation experiments on {N}orth {S}ea ctenophores.}, ' ...
'journal = {Helgol\"{a}nder wissenschaftliche Meeresuntersuchungen}, ' ...
'volume = {20}, ' ...
'number = {1-4}, '...
'pages = {304--317}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Grev1975'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.ices.dk/sites/pub/Publication~Reports/Plankton~leaflets/SHEET146.PDF}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GyllGrev1979'; type = 'Article'; bib = [ ... 
'author = {Gyllenberg, F. and Greve, W.}, ' ... 
'year = {1979}, ' ...
'title = {Studies on oxygen uptake in ctenophores}, ' ...
'journal = {Annals zool. fenn.}, ' ...
'volume = {16}, ' ...
'pages = {44--49}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WalrLang2013'; type = 'Article'; bib = [ ... 
'author = {Walraven, L. van and Langenberg, V. T. and Veer, H. W. van der }, ' ... 
'year = {2013}, ' ...
'title = {Seasonal occurrence of the invasive ctenophore \emph{Mnemiopsis leidyi} in the western {D}utch {W}adden {S}ea}, ' ...
'journal = {J. Sea Res}, ' ...
'volume = {82}, ' ...
'pages = {86--92}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Walr2011'; type = 'Misc'; bib = ...
'note = {Lodewijk van Walraven Wadden Sea sampling, length-wet weight relationships (2009) and dry weight, C, N (2011)}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MaleFaga1993'; type = 'Article'; bib = [ ... 
'author = {Malej, A. and Faganeli, J. and Pezdic, J.}, ' ... 
'year = {1993}, ' ...
'title = {Stable isotope and biochemical fractionation in the marine pelagic food chain: the jellyfish \emph{Pelagia noctiluca} and net zooplankton.}, ' ...
'journal = {Marine  Biology}, ' ...
'volume = {116}, ' ...
'pages = {565--570}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

