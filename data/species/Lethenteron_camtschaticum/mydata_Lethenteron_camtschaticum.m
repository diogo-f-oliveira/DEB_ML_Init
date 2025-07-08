function [data, auxData, metaData, txtData, weights] = mydata_Lethenteron_camtschaticum
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Cephalaspidomorphi'; 
metaData.order      = 'Petromyzontiformes'; 
metaData.family     = 'Petromyzontidae';
metaData.species    = 'Lethenteron_camtschaticum'; 
metaData.species_en = 'Arctic lamprey'; 

metaData.ecoCode.climate = {'Dfc','ME'};
metaData.ecoCode.ecozone = {'TH','MN'};
metaData.ecoCode.habitat = {'0iFr','piMc'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bpD','piTvf'};
metaData.ecoCode.gender  = {'Dt'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(10); % K, body temperature
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};                             
metaData.date_subm = [2024 01 01];                          
metaData.email     = {'bas.kooijman@vu.nl'};                 
metaData.address   = {'VU University Amsterdam'};      

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 01];

%% set data
% zero-variate data;
data.ab = 30;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'fishbase';   
  temp.ab = C2K(10); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 22.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase';
data.Li  = 63;     units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 4.86e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg length 0.85-1.23 mm, width 0.75-1.14 mm: pi/6*0.104*0.0945^2';
data.Wwp = 17.9;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00148*Lp^3.02, see F2)';
data.Wwi = 402;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00148*Li^3.02, see F2; max published weight 200 g)';

data.NR  = 34586;   units.NR  = '#';   label.NR  = 'eggs at the end of life';bibkey.NR  = 'fishbase';   
  temp.NR = C2K(10); units.temp.NR = 'K'; label.temp.NR = 'temperature';
  comment.NR = 'anadromous population from Kamchatka';

% uni-variate data at f
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0  1.203
1  4.231
2  9.173
3 12.537
4 16.875];
data.tL(:,1) = 365 * (0.2+data.tL(:,1));
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KuchSavv2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'spawns once at end of life; parasitic';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'length-weight: Ww in g = 0.00148*(TL in cm)^3.02';
metaData.bibkey.F2 = 'fishbase';
F3 = 'Boreal: 5-18 C';
metaData.bibkey.F3 = 'fishbase';
F4 = 'Non-anadromous individuals are rarely over 18 cm';
metaData.bibkey.F4 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4);

%% Links
metaData.links.id_CoL = '6Q2LL'; % Cat of Life
metaData.links.id_ITIS = '622287'; % ITIS
metaData.links.id_EoL = '46582328'; % Ency of Life
metaData.links.id_Wiki = 'Lethenteron_camtschaticum'; % Wikipedia
metaData.links.id_ADW = 'Lethenteron_camtschaticum'; % ADW
metaData.links.id_Taxo = '101341'; % Taxonomicon
metaData.links.id_WoRMS = '101173'; % WoRMS
metaData.links.id_fishbase = 'Lethenteron-camtschaticum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lethenteron_camtschaticum}}';  
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
bibkey = 'KuchSavv2007'; type = 'article'; bib = [ ...  
'doi = {10.1134/s0032945207010055}, ' ...
'author = {A. V. Kucheryavyi and K. A. Savvaitova and D. S. Pavlov and M. A. Gruzdeva and K. V. Kuzishchin and J. A. Stanford}, ' ...
'year = {2007}, ' ...
'title  = {Variations of life history strategy of the arctic lamprey \emph{Lethenteron camtschaticum} from the {U}tkholok {R}iver ({W}estern {K}amchatka)}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {47(1)}, ' ...
'page = {37–52}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Lethenteron-camtschaticum.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
