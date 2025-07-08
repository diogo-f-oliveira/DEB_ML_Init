function [data, auxData, metaData, txtData, weights] = mydata_Rhinobatos_productus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rhinopristiformes'; 
metaData.family     = 'Rhinobatidae';
metaData.species    = 'Rhinobatos_productus'; 
metaData.species_en = 'Shovelnose guitarfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2013 04 11];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 4.5*30.5;units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'iucn';    
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temps for all data are guessed';
data.ap = 7*365;  units.ap = 'd';   label.ap = 'age at puberty';           bibkey.ap = 'TimmBray1997';
  temp.ap = C2K(15); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 16*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 23;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'TimmBray1997';
data.Lp  = 99;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'TimmBray1997';
 comment.Lp = 'TimmBray1997 for females';
data.Li  = 137;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'TimmBray1997';

data.Wwb = 25.4; units.Wwb = 'g';   label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'estimated';
 comment.Wwb = 'estimate based on Wwb = Wwi * (Lb/Li)^3';
data.Wwi = 5363; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 9/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'TimmBray1997';   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.005	26.891
0.970	43.724
0.972	36.950
1.919	56.657
1.975	53.988
2.953	60.352
3.930	68.974
3.989	56.657
4.906	87.038
5.969	85.806
6.892	85.601
6.973	98.534
6.974	97.302
7.952	99.560
7.982	88.886
9.964	111.877
10.939	128.094];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
  temp.tL_f = C2K(15); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'TimmBray1997';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.008	38.387
0.009	40.440
0.941	51.935
0.968	55.630
2.980	67.331
3.008	62.610
3.898	88.680
4.959	100.997
4.961	92.170
4.988	90.733
4.989	89.707
5.944	71.232
5.972	68.152
5.996	88.270
5.997	83.138
7.950	107.771
7.951	103.666
7.982	91.965
7.983	83.548
8.932	95.865
10.970	113.930];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
  temp.tL_m = C2K(15); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'TimmBray1997';
comment.tL_m = 'Data for males';

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

%% Grouping
set1 = {'tL_f','tL_m'}; subtitle1 = 'Data for females, males';
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'ovoviviparous';
metaData.bibkey.F1 = 'Wiki';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4NPQL'; % Cat of Life
metaData.links.id_ITIS = '160818'; % ITIS
metaData.links.id_EoL = '46560686'; % Ency of Life
metaData.links.id_Wiki = 'Pseudobatos_productus'; % Wikipedia
metaData.links.id_ADW = 'Rhinobatos_productus'; % ADW
metaData.links.id_Taxo = '42033'; % Taxonomicon
metaData.links.id_WoRMS = '1043469'; % WoRMS
metaData.links.id_fishbase = 'Rhinobatos-productus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Shovelnose_guitarfish}}'; 
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
bibkey = 'TimmBray1997'; type = 'Article'; bib = [ ...  
'author = {Timmons, M. and Bray, R. N.}, ' ...
'year = {1997}, ' ...
'title  = {Age, growth, and sexual maturity of shovelnose guitarfish, \emph{Rhinobatos productus} ({A}yres)}, ' ...
'journal = {Fishery Bulletin}, ' ...
'volume = {95}, ' ...
'pages = {349--359}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Rhinobatos_productus}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'iucn'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.iucnredlist.org/details/60171/0}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ichthyology'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.flmnh.ufl.edu/fish/Gallery/Descript/LittleSkate/LittleSkate.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  