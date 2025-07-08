function [data, auxData, metaData, txtData, weights] = mydata_Dasyatis_chrysonota

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Dasyatidae';
metaData.species    = 'Dasyatis_chrysonota'; 
metaData.species_en = 'Blue stingray'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MASE','MIW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 29];                          
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
data.ab = 10*30.5; units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'Cowl1990';    
  temp.ab = C2K(24.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 14*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'Cowl1997';   
  temp.am = C2K(24.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 19; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Cowl1997';
data.Lp  = 50; units.Lp  = 'cm';  label.Lp  = 'disc width at puberty'; bibkey.Lp  = 'Cowl1997';
data.Lpm  = 40.8; units.Lpm  = 'cm';  label.Lpm  = 'disc width at puberty for males'; bibkey.Lpm  = 'Cowl1997';
data.Li  = 75.5;   units.Li  = 'cm';  label.Li  = 'ultimate disc width';   bibkey.Li  = 'Cowl1990';
data.Lim  = 62.6;   units.Lim  = 'cm';  label.Lim  = 'ultimate disc width for males';   bibkey.Lim  = 'Cowl1990';

data.Wwi = 14.8e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Cowl1990';
 comment.Wwi = 'based on 1e-5*(10*Li)^3.186, see F1';

data.Ri  = 2.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(24.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-5 pups per litter, assumed 1 litter per yr';
  
% uni-variate data at f
% time-length
data.tL_f = [ ... % time since birth (yr), disc width (cm)
 0	19.326
 1	25.783
 2	29.473
 3	33.087
 4	37.063
 5	40.195
 6	43.556
 7	46.729
 8	49.226
 9	51.723
10	54.130
11	56.911
12	59.802
13	61.428
14	59.176];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'disc width', 'female'};  
  temp.tL_f = C2K(14); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Cowl1997';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), disc width (cm)
0	18.429
1	24.283
2	28.161
3	30.702
4	33.893
5	36.754
6	38.643
7	41.458
8	44.336
9	47.225];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'disc width', 'male'};  
  temp.tL_m = C2K(14); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Cowl1997';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g =  1e-5*(DW in mm)^3.186 for females, 9e-6*(DW in mm)^3.2512 for males';
metaData.bibkey.F1 = 'Cowl1990';
F2 = 'ovoviviparous';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6CBSS'; % Cat of Life
metaData.links.id_ITIS = '564344'; % ITIS
metaData.links.id_EoL = '46560877'; % Ency of Life
metaData.links.id_Wiki = 'Dasyatis_chrysonota'; % Wikipedia
metaData.links.id_ADW = 'Dasyatis_chrysonota'; % ADW
metaData.links.id_Taxo = '192575'; % Taxonomicon
metaData.links.id_WoRMS = '212250'; % WoRMS
metaData.links.id_fishbase = 'Dasyatis-chrysonota'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Dasyatis_chrysonota}}'; 
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
bibkey = 'Cowl1997'; type = 'Article'; bib = [ ... 
'doi = {10.2989/025776197784161054}, ' ...
'author = {P. D. Cowley}, ' ...
'year = {1997}, ' ...
'title  = {Age and growth of the blue stingray \emph{Dasyatis chrysonota chrysonota} from the {S}outh-{E}astern {C}ape coast of {S}outh {A}frica}, ' ...
'journal = {South African Journal of Marine Science}, ' ...
'volume = {18(1)}, ' ...
'pages = {31-38}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Cowl1990'; type = 'phdthesis'; bib = [ ... 
'author = {P. D. Cowley}, ' ...
'year = {1990}, ' ...
'title  = {The taxonomy and life history of the blue stingray \emph{Dasyatis marmorata capensis} ({B}atoidea: {D}asyatidae) from southern {A}frica}, ' ...
'school = {Rhodes University, Grahamstown}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Dasyatis-chrysonota.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  