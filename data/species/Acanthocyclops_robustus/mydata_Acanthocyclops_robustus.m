function [data, auxData, metaData, txtData, weights] = mydata_Acanthocyclops_robustus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Hexanauplia'; 
metaData.order      = 'Cyclopoida'; 
metaData.family     = 'Cyclopidae';
metaData.species    = 'Acanthocyclops_robustus'; 
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
metaData.data_0     = {'aj'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wdb'; 'Wdj'; 'Wdp'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'T-ab'; 'T-aj'; 'T-ap'; 'T-am'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2011 12 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 01 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'}; 

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 10 30];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 02 04]; 

%% set data
% zero-variate data

data.tj = 10;        units.tj = 'd';      label.tj = 'time since birth at metam'; bibkey.tj = 'Vijv2011';   
  temp.tj = C2K(17.5);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.am = 75;        units.am = 'd';      label.am = 'life span';                bibkey.am = 'HoppMaie1997';   
  temp.am = C2K(19); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.012;    units.Lb  = 'cm';    label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
data.Lj  = 0.037;    units.Lj  = 'cm';    label.Lj  = 'total length at metam';   bibkey.Lj  = 'Vijv1980';
data.Lp  = 0.147;    units.Lp  = 'cm';    label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Vijv1980';
data.Li  = 0.147;    units.Li  = 'cm';    label.Li  = 'ultimate total length';   bibkey.Li  = 'Vijv1980';

data.Wdb = 0.0493;   units.Wdb = 'mug';   label.Wdb = 'dry weight at birth';     bibkey.Wdb = 'Vijv1980';
  comment.Wdb = 'All weights calculated from length using F3';
data.Wdj = 0.327;    units.Wdj = 'mug';   label.Wdj = 'dry weight at metam';     bibkey.Wdj = 'Vijv1980';
data.Wdp = 3.320;    units.Wdp = 'mug';   label.Wdp = 'dry weight at puberty';   bibkey.Wdp = 'Vijv1980';
data.Wdi = 3.320;    units.Wdi = 'mug';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'Vijv1980';

data.Ri  = 110/ 3;   units.Ri  = '#/d';   label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'HoppMaie1997';   
  temp.Ri = C2K(19); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '110 eggs per female, one clutch per 3 d on mixed diet'; 

% uni-variate data

% time-length, Koos Vijverberg (pers com) for females: T = 273+17.5
data.tL = [  ... % duration of stage (d), length (mm)
      1.2 0.37  
      1.0 0.48
      0.9 0.596
      0.8 0.721
      1.6 1.055
      40  1.421];
data.tL(:,1) = cumsum([10; data.tL(1:5,1)]);
data.tL(:,2) = data.tL(:,2)/ 10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(17.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Vijv2011';
 
% temperature-age at birth
data.Tab = [ ... % temperature (C), age at birth (d)
 2.5 18.6
 5   10.4
10    4.0
15    2.4
20    1.4
25    1.0];
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'Vijv1980';

% time - spawning data from Vijv1980 
%  not used; concerns buffer handling rule only
Ta0 = [ ... % temperature (C), time between broods (d)
 5   3.6
10   0.6
15   1.2
20   0.6
25   0.3];

% temperature-time since birth at metam
% time of combined naupliar instars (aj - ab)
%   where aj is age at first copepodite stage
data.Ttj = [ ... % temperature (C), time since birth at metam (d)
 2.5 85.0 
 5   46.6
10   13.0
15   11.4
20    6.4
25    3.2];
units.Ttj   = {'C', 'd'};  label.Ttj = {'temperature', 'time since birth at metam'};  
bibkey.Ttj = 'Vijv1980';

% T-tp data from Vijv1980
% time of combined copepodite stages C1-C5 (ap - aj)
%   where ap is age at last copepodite stage
data.Ttp = [ ... % temperature (C), time since metam at puberty (d) for male, female
 2.5 54 61 
 5   30 33
10   14 19
15   10 12
20    7  8
25    6  7];
data.Ttp = data.Ttp(:,[1 3]); % select females
units.Ttp   = {'C', 'd'};  label.Ttp = {'temperature', 'time since metam at puberty'};  
bibkey.Ttp = 'Vijv1980';

% data from Vijv1980
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
metaData.links.id_CoL = '7ZGT6'; % Cat of Life
metaData.links.id_ITIS = '88772'; % ITIS
metaData.links.id_EoL = '53764925'; % Ency of Life
metaData.links.id_Wiki = 'Acanthocyclops'; % Wikipedia
metaData.links.id_ADW = 'Acanthocyclops_robustus'; % ADW
metaData.links.id_Taxo = '668148'; % Taxonomicon
metaData.links.id_WoRMS = '729870'; % WoRMS

%% References
bibkey = 'USGS'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.glsc.usgs.gov/greatlakescopepods/Detail.php?GROUP=Cyclopoid&SPECIES=Acanthocyclops~robustus}}';
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
'author = {Vijverberg, J. and Frank, T. H.}, ' ... 
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

