function [data, auxData, metaData, txtData, weights] = mydata_Hyla_eximia
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Hylidae';
metaData.species    = 'Hyla_eximia'; 
metaData.species_en = 'Mountain tree frog'; 

metaData.ecoCode.climate = {'Am', 'BSk', 'BSh'};
metaData.ecoCode.ecozone = {'THn', 'TN'};
metaData.ecoCode.habitat = {'0jFp', 'jiTh', 'jiTg'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 06 03];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 03]; 

%% set data
% zero-variate data

data.am = 22*365; units.am = 'd';    label.am = 'life span';                        bibkey.am = 'AnAge';   
  temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Hyla arborea';

data.Lp  = 2.3;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';                    bibkey.Lp  = 'Gros1994';
  comment.Lp = 'based on Hyla arborea';
data.Li  = 3.75;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';          bibkey.Li  = 'HernRami2018';
data.Lim  = 3.27; units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';           bibkey.Lim  = 'HernRami2018';

data.Wwb = 9.8e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'HernRami2018';
  comment.Wwb = 'based on clutch mass 1.44 g, clutch size 1476';
data.Wwp = 1.0;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';              bibkey.Wwp = {'HernRami2018','Gros1994'};
  comment.Wwp = 'based on (Lp/Li)^3 * Wwi';
data.Wwi = 4.4; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';    bibkey.Wwi = 'HernRami2018';
data.Wwim = 3.5; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';    bibkey.Wwim = 'HernRami2018';

data.Ri  = 1476/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at 4.5 cm SVL';     bibkey.Ri  = 'HernRami2018';   
  temp.Ri  = C2K(20.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% length - change in length
data.LdL_f = [ ... %  SVL (cm), change in SVL (cm/d)
3.104582	0.007108
3.148429	0.014307
3.198053	0.007447
3.209102	0.006670
3.255767	0.003302
3.347998	0.003813
3.413206	0.006310
3.450036	0.003720
3.458656	0.002943
3.547465	0.001988
3.552061	0.003712
3.560695	0.002849];
units.LdL_f  = {'cm', 'cm/d'};  label.LdL_f = {'SVL', 'change in SVL', 'female'};  
temp.LdL_f   = C2K(20.5);  units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f = 'HernRami2018';
comment.LdL_f = 'data for females';
%
data.LdL_m = [ ... %  SVL (cm), change in SVL (cm/d)
2.471667	0.010278
2.805901	0.024004
2.832061	0.004767
2.832081	0.005093
2.835472	0.000936
2.837957	0.011860
2.872122	0.004445
2.876598	0.018141
2.888678	0.007055
2.901233	0.003795
2.913897	0.002329
2.923976	0.018308
2.937977	0.008853
2.944819	0.001517
2.948681	0.005104
2.974504	0.010324
2.979449	0.001764
2.988598	0.002417
3.002084	0.014484
3.003079	0.000870
3.009337	0.013914
3.021471	0.003725
3.039680	0.003563
3.083361	0.002834
3.088732	0.001285
3.112411	0.001206
3.112471	0.002184
3.167256	0.004309
3.178281	0.005859
3.181766	0.003250];
units.LdL_m  = {'cm', 'cm/d'};  label.LdL_m = {'SVL', 'change in SVL', 'male'};  
temp.LdL_m   = C2K(20.5);  units.temp.LdL_m = 'K'; label.temp.LdL_m = 'temperature';
bibkey.LdL_m = 'HernRami2018';
comment.LdL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 5 * weights.Li;
weights.Lim = 5 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LdL_f','LdL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '37VNH'; % Cat of Life
metaData.links.id_ITIS = '1104993'; % ITIS
metaData.links.id_EoL = '1019447'; % Ency of Life
metaData.links.id_Wiki = 'Dryophytes_eximius'; % Wikipedia
metaData.links.id_ADW = 'Hyla_eximia'; % ADW
metaData.links.id_Taxo = '138153'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Hyla+eximia'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hyla_eximia}}';
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
bibkey = 'Gros1994'; type = 'Book'; bib = [ ...  
'author = {Grosse, W.-R.}, ' ...
'year = {1994}, ' ...
'title  = {Der Laubfrosch \emph{Hyla arborea}}, ' ...
'publisher = {Westarp Wissenschaften}, ' ...
'series = {Die Neue Brehm-Buecherei}, ' ...
'volume = {615}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HernRami2018'; type = 'Article'; bib = [ ... 
'doi = {10.7717/peerj.5897}, ' ...
'author = {Uriel Hern\''{a}ndez-Salinas and Aurelio Ram\''{i}rez-Bautista and Barry P. Stephenson and Raciel Cruz-Elizalde and Christian Berriozabal-Islas and Carlos Jes\''{u}s Balderas-Valdivia}, ' ... 
'year = {2018}, ' ...
'title = {Amphibian life history in a temperate environment of the {M}exican {P}lateau: dimorphism, phenology and trophic ecology of a hylid frog, \emph{Hyla eximia} (= \emph{Dryophytes eximius})}, ' ...
'journal = {PeerJ}, ' ...
'volume = {6}, ' ...
'pages = {e5897}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Hyla+eximia}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Hyla_arborea}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

