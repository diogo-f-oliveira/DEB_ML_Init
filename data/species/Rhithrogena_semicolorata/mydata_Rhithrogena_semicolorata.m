function [data, auxData, metaData, txtData, weights] = mydata_Rhithrogena_semicolorata 

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Ephemeroptera'; 
metaData.family     = 'Heptageniidae';
metaData.species    = 'Rhithrogena_semicolorata'; 
metaData.species_en = 'Olive Upright'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0eFr', '0eFc', 'eiTg'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'beH', 'beD', 'beS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'aj' ;'am'; 'L0'; 'Lj'; 'Li'; 'Wdj'; 'Ni'}; 
metaData.data_1     = {'T-ab'; 't-Wd_f'; 't-Ww'; 'L-Wd'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Andre Gergs','Kim Rakel'};           
metaData.date_subm = [2017 03 08];                              
metaData.email    = {'gergs@gaiac.rwth-aachen.de'};             
metaData.address  = {'gaiac - Research Institute for Ecosystem Analysis and Assessment, 52072 Aachen, Germany'};  

metaData.author_mod_1   = {'Andre Gergs','Kim Rakel'};           
metaData.date_mod_1     = [2018 02 18];                              
metaData.email_mod_1    = {'gergs@gaiac.rwth-aachen.de'};             
metaData.address_mod_1  = {'gaiac - Research Institute for Ecosystem Analysis and Assessment, 52072 Aachen, Germany'};  

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2018 02 18]; 


%% set data
% zero-variate data;
data.ab = 57.7;      units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'HumpElli1980';   
  temp.ab = C2K(8.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 60;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'WinkKoop2007';
   temp.tp = C2K(14); units.temp.tp = 'K'; label.temp.tp = 'temperature';
    comment.tp = 'Egg maturation was completed in the last larval instar (black wing pads) immediately before emergence; decline of triglyceride concentrations within the last 50 days before emergence; strong decline in triglyceride concentration and the development of eggs in the larval abdomen were observed; The use of stored lipids for egg production seems logical from an ecological point of view and has been observed for other non-aquatic insects (WinkKoop2007), temperature is guessed for the growth periods in autumn and spring ';
data.tj = 110;     units.tj = 'd';    label.tj = 'time since birth at emergence';     bibkey.tj = 'WinkKoop2007';   
  temp.tj = C2K(14);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
  comment.tj = 'time to adult emergence excluding time of winter diapause, guessed temperature, see comment.tp';
data.am = 7;     units.am = 'd';    label.am = 'life span as (sub)imago';     bibkey.am = 'guess';
  temp.am = C2K(8.5);  units.temp.am = 'K'; label.temp.am = 'temperature, average yearly temperature';  
  comment.am = 'based on fact that (sub)imago does not feed';
  
data.L0  = 0.0185;   units.L0  = 'cm';   label.L0  = 'egg length';     bibkey.L0  = 'Eiseler2006';    
data.Lj  = 1.15;   units.Lj  = 'cm';   label.Lj  = 'ultimate length nymph';  bibkey.Lj  = 'HellWink2011'; 
data.Li  = 1.2;   units.Li  = 'cm';   label.Li  = 'ultimate length';    bibkey.Li  = 'GiusMicc2008'; 'BaueSold2012';
  comment.Li = 'body length of imago: 8.5-12 mm (BaueSold2012)';
  
data.Wdj = 0.00797;   units.Wdj = 'g';    label.Wdj = 'maximum dry weight of nymph';             bibkey.Wdj = 'GiusMicc2008';
  comment.Wdj = 'derived from supplementary material of GiusMicc2008';
  
data.Ni = 1775;   units.Ni = '#';    label.Ni = 'total number of eggs';             bibkey.Ni = 'RybiWink2012';   
  temp.Ni = C2K(8.6);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';

% uni-variate data

% uni-variate data at f = 0.8 (this value should be added in pars_init_my_pet as a parameter f_tL)
% T-ab data
data.Tab = [ ... % temperature (C), age at birth
    5.406	111.1
    5.677	111.1
    6.084	110.9
    5.677	109.6
    7.878	60.78
    8.217	60.55
    8.555	60.33
    8.589	54.79
    8.623	51.9
    11.7	27.5
    12.08	28.84
    12.11	27.28
    12.45	27.5
    14.41	21.52
    14.45	19.74
    15.06	17.74
    15.53	17.52
    15.84	17.3
    16.17	17.52
    19.76	12.64
    19.86	10.65
    19.59	10.43
    19.22	9.094
    19.63	8.872
    19.93	9.316];
 data.Tab(:,2);
 units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'}; 
 bibkey.Tab = 'HumpElli1980';
 
% t-Wd data
% data from RybiWink2012 - AGE UNKNOWN
data.tW = [5	     12	     26	    40	    54; %time since start of experiment
           0.0007813	0.00101	0.00149	0.001803	0.002212]'; % dry weight at f and T             
units.tW   = {'d', 'g'};  label.tW = {'time since start of experiment', 'dry weight'};  
temp.tW  = C2K(8.1);  units.temp.tW = 'K'; label.temp.tW = 'temperature'; bibkey.tW = 'RybiWink2012';

% t-Wd data
% data from RybiWink2012 - AGE UNKNOWN
data.tW2 = [1.313 7.656 14.33 20.56 27.13 33.69 40.14 46.59; %time since start of experiment
            0.0006375 0.0008964 0.001096 0.001195 0.001574 0.002888 0.003187 0.003884]'; % dry weight at f and T             
units.tW2   = {'d', 'g'};  label.tW2 = {'time since start of experiment', 'dry weight'};  
temp.tW2  = C2K(8.6);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature'; bibkey.tW2 = 'RybiWink2012';

% t-Ww data
% data from field measurements starting ~1 month before adult emergence - AGE UNKNOWN
data.tWw = [[0	0.35	0.7	3.83	6.61	6.96	7.31	13.23	13.58	14.27	17.055	19.84	20.188	20.536	25.4081	26.104	26.452	26.8	27.496	27.844	28.192	31.673	32.021	32.369	32.717	  ]; %time since start of experiment
             0.005407	0.005275	0.001648	0.00633	0.0057035	0.005538	0.01088	0.006923	0.007516	0.008011	0.01371	0.020575	0.016113333	0.015725	0.01701	0.02301	0.02057	0.015825	0.01398	0.020075	0.01411	0.01866	0.01401	0.014045	0.01787	  ]'; % dry weight at f and T             
units.tWw   = {'d', 'g'};  label.tWw = {'time since start of measurements', 'wet weight'};  
temp.tWw  = C2K(14); %guessed temperature, see comment.tp 
units.temp.tWw = 'K'; label.temp.tWw = 'temperature'; bibkey.tWw = 'WinkKoop2007';

%  L-W data
%body length vs dry weight   
data.LW = [0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.1 1.2;      % cm, body length at f
           0.00003 0.00007 0.0003	0.0006 0.00175 0.00251 0.00336 0.0042 0.00544 0.0063 0.00797]';   % g, dry weights at f and T
units.LW = {'cm', 'mg'};     label.LW = {'body length', 'dry weights'};  
temp.LW  = C2K(8);  units.temp.LW = 'K'; label.temp.LW = 'temperature'; bibkey.LW = 'GiusMicc2008';

%% set weights for all real data
weights = setweights(data, []);
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
metaData.links.id_CoL = '4SBQW'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '3684255'; % Ency of Life
metaData.links.id_Wiki = 'Rhithrogena'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '17357'; % Taxonomicon
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
'howpublished = {\url{https://en.wikipedia.org/wiki/Mayfly}},'...
'note = {Accessed : 2017-03-31}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HumpElli1980'; type = 'Article'; bib = [ ... 
'author = {Humpesch, U. H. and Elliott, J. M.}, ' ... 
'year = {1980}, ' ...
'title = {Effect of Temperature on the Hatching Time of Eggs of Three \emph{Rhithrogena Spp.}(Ephemeroptera) from {A}ustrian Streams and an {E}nglish Stream and River}, ' ...
'journal = {Journal of Animal Ecology}, ' ...
'volume = {49}, ' ...
'number = {2}, '...
'pages = {643--661}, '...
'DOI = {10.2307/4269}, '...
'howpublished = {\url{https://www.jstor.org/stable/4269?seq=1#page_scan_tab_contents}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WinkKoop2007'; type = 'Article'; bib = [ ... 
'author = {Winkelmann, C. and Koop, J. H. E.}, ' ... 
'year = {2007}, ' ...
'title = {The management of metabolic energy storage during the life cycle of mayflies: a comparative field investigation of the collector-gatherer \emph{Ephemera danica} and the scraper \emph{Rhithrogena semicolorata}}, ' ...
'journal = {Journal of Comparative Physiology B}, ' ...
'volume = {177}, ' ...
'number = {1}, '...
'pages = {119--128}, '...
'DOI = {10.1007/s00360-006-0114-7},'...
'howpublished = {\url{http://link.springer.com/article/10.1007%%2Fs00360-006-0114-7}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'GiusMicc2008'; type = 'Article'; bib = [ ...
'author = {Giustini, M. and Miccoli, F. P. and De Luca, G. and Cicolani, B.}, ' ... 
'year = {2008}, ' ...
'title = {Length-weight relationships for some plecoptera and ephemeroptera from a carbonate stream in central {A}pennine ({I}taly)}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {605}, ' ...
'pages = {183--191}, '...
'DOI = {10.1007/s10750-008-9353-9},'...
'howpublished = {\url{http://link.springer.com/article/10.1007/s10750-008-9353-9}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'HellWink2011'; type = 'Article'; bib = [ ... 
'author = {Hellmann, C. and Winkelmann, C. and Worischka, S. and Benndorf, J.}, ' ... 
'year = {2011}, ' ...
'title = {Extended larval development compensates for sublethal effects of fish predation in a mayfly population (\emph{Rhithrogena semicolorata}, {E}phemeroptera)}, ' ...
'journal = {Limnologica}, ' ...
'volume = {41}, ' ...
'number = {3}, '...
'pages = {256--265}, '...
'DOI = {10.1016/j.limno.2010.10.005},'...
'howpublished = {\url{http://www.sciencedirect.com/science/article/pii/S0075951110000782}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'RybiWink2012'; type = 'Article'; bib = [ ... 
'author = {Rybicki, M. and Winkelmann, C. and Hellmann, C. and Bartels, P. and Jungmann, D.}, ' ... 
'year = {2012}, ' ...
'title = {Herbicide indirectly reduces physiological condition of a benthic grazer}, ' ...
'journal = {Aquatic Biology}, ' ...
'volume = {17}, ' ...
'pages = {153--166}, '...
'DOI = {10.3354/ab00472},'...
'howpublished = {\url{http://www.int-res.com/abstracts/ab/v17/n2/p153-166/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Eiseler2006'; type = 'Article'; bib = [ ... 
'author = {Eiseler B. and Haybach A.}, ' ... 
'year = {2006}, ' ...
'title = {Egg-taxonomy of the {G}erman species of the genus \emph{Rhithrogena} {E}aton, 1881 (diaphana and semicolorata groups) ({E}phemeroptera, {H}eptageniidae)}, ' ...
'journal = {Lauterbornia}, ' ...
'volume = {58}, ' ...
'pages = {23-39}, '...
'howpublished = {D-86424 Dinkelscherben, 2006-11-15}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

