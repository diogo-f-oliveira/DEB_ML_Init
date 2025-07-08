function [data, auxData, metaData, txtData, weights] = mydata_Mesocyclops_leukarti

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Hexanauplia'; 
metaData.order      = 'Cyclopoida'; 
metaData.family     = 'Cyclopidae';
metaData.species    = 'Mesocyclops_leukarti'; 
metaData.species_en = 'Copepod'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wdb'; 'Wdj'; 'Wdp'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'T-ab'; 'T-aj'; 'T-ap'; 'T-am'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2011 12 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 01 31];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 02 09]; 

%% set data
% zero-variate data

data.am = 52;        units.am = 'd';      label.am = 'life span';                bibkey.am = 'HoppMaie1997';   
  temp.am = C2K(19); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.0127;   units.Lb  = 'cm';    label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
data.Lj  = 0.0375;   units.Lj  = 'cm';    label.Lj  = 'total length at metam';   bibkey.Lj  = 'Vijv1980';
data.Lp  = 0.0933;   units.Lp  = 'cm';    label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Vijv1980';
data.Li  = 0.106;    units.Li  = 'cm';    label.Li  = 'ultimate total length';   bibkey.Li  = 'Vijv1980';

data.Wdb = 0.0542;   units.Wdb = 'mug';   label.Wdb = 'dry weight at birth';     bibkey.Wdb = 'Vijv1980';
  comment.Wdb = 'All weights calculated from length using F3';
data.Wdj = 0.3345;   units.Wdj = 'mug';   label.Wdj = 'dry weight at metam';     bibkey.Wdj = 'Vijv1980';
data.Wdp = 1.547;    units.Wdp = 'mug';   label.Wdp = 'dry weight at puberty';   bibkey.Wdp = 'Vijv1980';
data.Wdi = 1.9165;   units.Wdi = 'mug';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'Vijv1980';

data.Ri  = 45/ 4;    units.Ri  = '#/d';   label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'HoppMaie1997';   
  temp.Ri = C2K(19); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '110 eggs per female, one clutch per 3 d on mixed diet'; 

% uni-variate data

% time-length, Koos Vijverberg (pers com) for females: T = 273+17.5
data.tL = [  ... % duration of stage (d), length (mm)
      1.6 0.375  
      1.2 0.472
      1.5 0.545
      1.5 0.632
      1.6 0.826
      40  0.933];data.tL(:,1) = cumsum([10; data.tL(1:5,1)]);
data.tL(:,2) = data.tL(:,2)/ 10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(17.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Vijv2011';
 
% temperature-age at birth
data.Tab = [ ... % temperature (C), age at birth (d)
 5   20.8
10    6.2
15    3.3
20    1.9
25    1.3];
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'Vijv1980';

% time - spawning data from Vijv1980 
%  not used; concerns buffer handling rule only
Ta0 = [ ... % temperature (C), time between broods (d)
 5   5.1
10   0.6
15   0.6
20   0.4
25   0.3];

% temperature=time since birth at metam
% time of combined naupliar instars (aj - ab)
%   where aj is age at first copepodite stage
data.Ttj = [ ... % temperature (C), time since birth at metam (d)
 5   43.8
10   18.8
15    8.4
20    6.7
25    3.7];
units.Ttj   = {'C', 'd'};  label.Ttj = {'temperature', 'time since birth at metam'};  
bibkey.Ttj = 'Vijv1980';

% temperature-time since metam at puberty
% time of combined copepodite stages C1-C5 (ap - aj)
%   where ap is age at last copepodite stage
data.Ttp = [ ... % temperature (C), time since metam at puberty (d) for male, female
 5   33 37
10   15 18
15    9 11
20    7  8
25    6  7];
data.Ttp = data.Ttp(:,[1 3]); % select females
units.Ttp   = {'C', 'd'};  label.Ttp = {'temperature', 'time since metam at puberty'};  
bibkey.Ttp = 'Vijv1980';

% temperature-time since puberty at death
% time of last copepodite stage (am - ap)
%   where am is age at death
data.Ttm = [ ... % temperature (C), am-ap (d) for male, female
 5   84 144
10   83 116
15   39  60
20   24  54
25   21  29];
data.Ttm = data.Ttm(:,[1 3]); % select females
units.Ttm   = {'C', 'd'};  label.Ttm = {'temperature', 'time since puberty at death'};  
bibkey.Ttm = 'Vijv1980';
 
%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 50 * weights.Lb;
weights.Lp = 20 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.p_M = 1400; weights.psd.p_M = 20 * weights.psd.p_M;
data.psd.kap = 0.95; weights.psd.kap = 20 * weights.psd.kap;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Acceleration starts at birth and continues till puberty, beyond metam; growth ceases at puberty';
D2 = 'Data for females';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'sexual reproduction in last copepodite stage; 11 moults: 5 naupliar stages, 6 copepodite stages';
metaData.bibkey.F1 = 'Vijv1980'; 
F2 = 'cyclopoid: adult is carnivore, younger copepodites are omnivore, nauplii are herbivore';
metaData.bibkey.F2 = 'Vijv1980'; 
F3 = 'dry weight: log10(W in mug) = 0.24 + 1.68 * log10(L in mm)';
metaData.bibkey.F3 = 'VijvFran1976'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '7ZH94'; % Cat of Life
metaData.links.id_ITIS = '88693'; % ITIS
metaData.links.id_EoL = '54919317'; % Ency of Life
metaData.links.id_Wiki = 'Mesocyclops'; % Wikipedia
metaData.links.id_ADW = 'Mesocyclops_leukarti'; % ADW
metaData.links.id_Taxo = '124982'; % Taxonomicon
metaData.links.id_WoRMS = '730086'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Mesocyclops}}';
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
bibkey = 'Vijv1980'; type = 'Article'; bib = [ ... 
'author = {Vijverberg, J.}, ' ... 
'year = {1980}, ' ...
'title = {Effect of temperature in laboratory studies on the development and growth of Cladocera and copepoda from {T}jeukemeer, the {N}etherlands.}, ' ...
'journal = {Freshwater Biol}, ' ...
'volume = {10}, ' ...
'pages = {317--340}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VijvFran1976'; type = 'Article'; bib = [ ... 
'author = {Vijverberg, J. and Frank, Th. H.}, ' ... 
'year = {1976}, ' ...
'title = {The chemical composition and the enregy contents of copepods and cladocerans in relation to their size}, ' ...
'journal = {Freshwater Biol}, ' ...
'volume = {6}, ' ...
'pages = {333--345}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HoppMaie1997'; type = 'Article'; bib = [ ... 
'author = {Hopp, U. and Maier, G. and Bleher, R.}, ' ... 
'year = {1997}, ' ...
'title = {Reproduction and adult longevity of five planktonic cyclopoid copepods reared on different diets: a comparative study}, ' ...
'journal = {Freshwater Biol}, ' ...
'volume = {38}, ' ...
'pages = {289--300}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Vijv2011'; type = 'Misc'; bib = [ ...
'author = {Vijverberg, J.}, ' ... 
'year = {2011}, ' ...
'note = {Personal communication}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

