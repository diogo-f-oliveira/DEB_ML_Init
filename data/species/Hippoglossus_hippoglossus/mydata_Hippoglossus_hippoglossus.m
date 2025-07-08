function [data, auxData, metaData, txtData, weights] = mydata_Hippoglossus_hippoglossus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Hippoglossus_hippoglossus'; 
metaData.species_en = 'Atlantic halibut'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'R_L'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Magnus Aune Wiedmann','Starrlight Augustine','Bas Kooijman'};    
metaData.date_subm = [2017 03 06];              
metaData.email    = {'magnus.wiedmann@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva, 9007, Norway'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2021 07 05];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Adam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 04 06];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 06];

%% set data
% zero-variate data

data.ah = 18;        units.ah = 'd'; label.ah = 'age at hatch'; bibkey.ah = 'LonnKjor1982';   
  temp.ah = C2K(6);  units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ab = 50;        units.ab = 'd'; label.ab = 'age at birth'; bibkey.ab = 'BlaxDani1983';   
  temp.ab = C2K(6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'time till yolk resorption';
data.tp = 2920;      units.tp = 'd';  label.tp = 'time since birth at puberty for females'; bibkey.tp = 'WienJoha2011';
  temp.tp = C2K(6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2555;   units.tpm = 'd';  label.tpm = 'time since birth at puberty for males';  bibkey.tpm = 'WienJoha2011';
  temp.tpm = C2K(6);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 50*365;   units.am = 'd';  label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lh  = 0.65;   units.Lh  = 'cm';  label.Lh  = 'total length at hatch';    bibkey.Lh  = 'fishbase';  
data.Lb  = 1.15;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'MunkNiel2005';  
data.Lj  = 4;    units.Lj  = 'cm';  label.Lj  = 'total length at metam';    bibkey.Lj  = 'Wiki';  
data.Lp  = 110;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'JakuHaug1988'; 
data.Lpm  = 55;  units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'JakuHaug1988'; 
data.Li  = 350;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'WienJoha2011';
data.Lim = 180;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'WienJoha2011';

data.Wwb = 0.0141; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 3 till 3.8 mm: pi/6*0.3^3';
data.Wdb = 1.476e-3; units.Wdb = 'g';  label.Wdb = 'dry weight at birth';   bibkey.Wdb = 'LeinHolm1997'; 
  comment.Wdb = 'this number is after 40d at 4degC, but the variation in weight from hatching to the end of the yolk sac stage (50d) is small';
data.Wwi = 320e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight 320 kg, but 0.00589*Li^3.17 = 684e3 g';
data.Wwim = 83e3;  units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on 0.00589*Lim^3.17, see F2';

data.R195  = 6.67e6/365; units.R195  = '#/d'; label.R195  = 'reprod rate at TL 195 cm';   bibkey.R195  = 'HaugGull1988';   
  temp.R195 = C2K(6);  units.temp.R195 = 'K'; label.temp.R195 = 'temperature';
  comment.R195 = 'fishbase gives upper boudary of fecundity of 3.6e6';
data.R132  = 0.47e6/365; units.R132  = '#/d'; label.R132  = 'reprod rate at TL 132 cm';   bibkey.R132  = 'HaugGull1988';   
  temp.R132 = C2K(6);  units.temp.R132 = 'K'; label.temp.R132 = 'temperature';
 
% uni-variate data
% t-L data 
data.tL_f = [4 6 8 12 14 16 18 20 22;    % d, time since birth
           52.5 69 89 132 142 151 159 167 173]';  % cm, standard length
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'standard length', 'female'};  bibkey.tL_f = 'Andr1964'; 
temp.tL_f    = C2K(6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
comment.tL_f = 'Data for females'; 
%
data.tL_m = [6 8 12 14 16 18 20 22;    % y, time since birth
           59.1 69.9 106 115 120 125 129 133]';  % cm, snout-to-vent length at f and T (STANDARD LENGTH)
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'standard length', 'male'};  bibkey.tL_m = 'Andr1964'; 
temp.tL_m    = C2K(6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
comment.tL_m = 'Data for males'; 

% t-W data
data.tW_f = [4 6 8 12 14 16 18 20 22;    % yr, time since birth
           1.4 3.4 7 31 41 51 61 71 79]';  % kg, total weight
data.tW_f(:,1) = 365 * data.tW_f(:,1); % convert yr to d
data.tW_f(:,2) = 1e3 * data.tW_f(:,2); % g, convert kg to g
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  bibkey.tW_f = 'Andr1964'; 
temp.tW_f    = C2K(6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
comment.tW_f = 'Data for females'; 
%
data.tW_m = [6 8 12 14 16 18 20 22;    % yr, time since birth
           3.2 6.4 16 20 23 26 29 33]';  % kg, wet weight
data.tW_m(:,1) = 365 * data.tW_m(:,1); % convert yr to d
data.tW_m(:,2) = 1e3 * data.tW_m(:,2); % g, convert kg to g
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  bibkey.tW_m = 'Andr1964'; 
temp.tW_m    = C2K(6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
comment.tW_m = 'Data for males'; 

%% set weights for all real data
weights = setweights(data, []);
weights.Lb = weights.Lb * 0;
weights.Lh = weights.Lh * 0;
weights.Wdb = weights.Wdb * 0;
% weights.tL_f = weights.tL_f * 3;
% weights.tL_m = weights.tL_m * 3;
% weights.tW_f = weights.tW_f * 3;
% weights.tW_m = weights.tW_m * 3;
% weights.Wwb = weights.Wwb * 5;
% weights.Wwim = weights.Wwim * 10;
% weights.Wwi = weights.Wwi * 10;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.kap = 3 * weights.psd.kap;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'};  subtitle1 = {'Data for female, male'};
set2 = {'tW_f', 'tW_m'};  subtitle2 = {'Data for female, male'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: error repaired for ah and ab, spotted by Bastien Sadoul';
D3 = 'mod_1: Wdb ignored due to inconsistent data';
D4 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = 'Preferred temperature 3 to 8 C, depth 183 to 457 m';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'weight-length: weight (g) = 0.00589*(TL in cm)^3.17';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '3M25Y'; % Cat of Life
metaData.links.id_ITIS = '172933'; % ITIS
metaData.links.id_EoL = '46570100'; % Ency of Life
metaData.links.id_Wiki = 'Hippoglossus_hippoglossus'; % Wikipedia
metaData.links.id_ADW = 'Hippoglossus_hippoglossus'; % ADW
metaData.links.id_Taxo = '46945'; % Taxonomicon
metaData.links.id_WoRMS = '127138'; % WoRMS
metaData.links.id_fishbase = 'Hippoglossus-hippoglossus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hippoglossus_hippoglossus}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/1371}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Andr1964'; type = 'Book'; bib = [ ...  
'author = {Andriyashev, A. P.}, ' ...
'year = {1964}, ' ...
'title  = {Fishes of the northern seas of the U.S.S.R.}, ' ...
'publisher = {Smithsonian Institution of the National Science Foundation, Washington D.C.}, ' ...
'howpublished = {''}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HaugGull1988'; type = 'Article'; bib = [ ... 
'author = {Haug, T. and Gulliksen, B.}, ' ... 
'year = {1988}, ' ...
'title = {Fecundity and oocyte sizes in ovaries of female Atlantic halibut, \emph{Hippoglossus hippoglossus} (L.)}, ' ...
'journal = {Sarsia}, ' ...
'volume = {73}, ' ...
'number = {''}, '...
'pages = {259-261}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LeinHolm1997'; type = 'Article'; bib = [ ... 
'author = {Lein, I. and Holmefjord, I. and Rye, M.}, ' ... 
'year = {1997}, ' ...
'title = {Effects of temperature on yolk sac larvae of Atlantic halibut \emph{Hippoglossus hippoglossus} L.}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {157}, ' ...
'pages = {123-135}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JakuHaug1988'; type = 'Article'; bib = [ ... 
'author = {Jakupsstovu, S.H. and Haug, T.}, ' ... 
'year = {1988}, ' ...
'title = {Growth, sexual maturation, and spawning season of Atlantic halibut \emph{Hippoglossus hippoglossus}, in Faroese waters}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {6}, ' ...
'number = {3}, '...
'pages = {201-215}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WienJoha2011'; type = 'book'; bib = [ ... % OK (MAW)
'author = {Wienerroither, R. and Johannesen, E. and Dolgov, A. and Byrkjedal, I. and Bjelland, O. and Drevetnyak, K. and Eriksen, K. B. and H{\o}ines, \r{A}. and Langhelle, G. and Lang{\o}y H. and Prokhorova, T. and Prozorkevich, D. and Wenneck, T.}, ' ... 
'year = {2011}, ' ...
'title = {Atlas of the Barents Sea fishes}, ' ...
'publisher = {IMR/PINRO}, ' ...
'howpublished = {\url{http://www.imr.no/filarkiv/2011/09/atlas_august_2011_press_quality_til_web.pdf/nb-no}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MunkNiel2005'; type = 'Book'; bib = [ ... % OK (MAW)
'author = {Munk, P. and Nielsen, J. G.}, ' ... 
'year = {2005}, ' ...
'title = {Eggs and larvae of North Sea fishes},' ...
'publisher = {biofolia, Frederiksberg}, ' ...
'pages = {50}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LonnKjor1982'; type = 'Article'; bib = [ ... 
'author = {L{\o}nning, S. and Kj{\o}rsvik, E. and Haug, T. and Gulliksen, B.}, ' ... 
'year = {1982}, ' ...
'title = {The early development of the halibut, \emph{Hippoglossus hippoglossus} (L.), compared with other marine teleosts}, ' ...
'journal = {Sarsia}, ' ...
'volume = {67}, ' ...
'pages = {85-91}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BlaxDani1983'; type = 'Article'; bib = [ ... 
'author = {Blaxter, J. H. S. and Danielssen, D. and Moksness, E. and {\O}iestad, V.}, ' ... 
'year = {1983}, ' ...
'title = {Description of the early development of the halibut \emph{Hippoglossus hippoglossus} and attempts to rear the larvae past first feeding}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {73}, ' ...
'pages = {99-107}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

