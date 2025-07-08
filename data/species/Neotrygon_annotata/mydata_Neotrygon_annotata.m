function [data, auxData, metaData, txtData, weights] = mydata_Neotrygon_annotata
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Dasyatidae';
metaData.species    = 'Neotrygon_annotata'; 
metaData.species_en = 'Plain maskray'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MASE','MIW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 30];                          
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
data.ab = 10*30.5; units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 13*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'JacoBenn2010';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 13; units.Lb  = 'cm';  label.Lb  = 'disc width at birth';   bibkey.Lb  = 'fishbase';
  comment.Lb = 'TL 12-14 cm';
data.Lp  = 20.5; units.Lp  = 'cm';  label.Lp  = 'disc width at puberty'; bibkey.Lp  = 'JacoBenn2010';
data.Lpm  = 19; units.Lpm  = 'cm';  label.Lpm  = 'disc width at puberty for males'; bibkey.Lpm  = 'JacoBenn2010';
data.Li  = 27.8;   units.Li  = 'cm';  label.Li  = 'ultimate disc width';   bibkey.Li  = 'JacoBenn2010';
data.Lim  = 24;   units.Lim  = 'cm';  label.Lim  = 'ultimate disc width for males';   bibkey.Lim  = 'JacoBenn2010';

data.Wwi = 604; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'JacoBenn2010';
data.Wwim = 391; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'JacoBenn2010';

data.Ri  = 1.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-3 pups per litter, assumed 1 litter per yr';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), disc width (cm)
0.507	16.558
0.950	14.234
0.950	14.736
0.950	15.364
1.901	18.505
1.901	19.384
1.933	18.128
1.933	20.138
2.947	18.505
3.992	22.588
4.436	20.138
4.436	20.892
5.006	21.080
5.450	24.849
5.956	21.771
6.463	23.216
6.939	23.656
6.939	24.221
7.382	24.849
7.477	23.467
7.921	24.158
9.980	23.844
9.980	25.352
10.962	24.912
11.438	23.467
11.976	28.053
12.008	26.357
12.990	23.844];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1)); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'disc width', 'female'};  
temp.tL_f = C2K(28); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'JacoBenn2010';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), disc width (cm)
0.444	14.862
0.887	16.307
0.950	13.982
0.950	16.935
1.933	17.563
2.947	21.018
2.947	19.887
3.010	18.945
3.010	16.558
3.042	21.457
3.390	18.568
3.485	19.824
3.485	20.264
3.929	23.216
3.929	21.771
3.929	19.133
3.929	18.505
3.960	21.269
4.024	20.704
4.024	20.201
4.024	17.626
4.436	21.143
4.436	21.834
4.467	19.510
4.499	18.882
4.943	24.284
4.943	22.462
4.943	21.143
4.943	20.389
4.974	19.636
5.481	19.510
5.925	23.279
5.925	19.824
5.956	20.389
8.491	24.347
8.998	21.709
8.998	23.028];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1)); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'disc width', 'male'};  
temp.tL_m = C2K(28); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'JacoBenn2010';
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
F1 = 'length-weight: Ww in g =  2.66e-5*(DW in mm)^3.01 for females, 1.32e-5*(DW in mm)^3.137 for males';
metaData.bibkey.F1 = 'JacoBenn2010';
F2 = 'ovoviviparous';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '46W2X'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46560959'; % Ency of Life
metaData.links.id_Wiki = 'Neotrygon_annotata'; % Wikipedia
metaData.links.id_ADW = 'Neotrygon_annotata'; % ADW
metaData.links.id_Taxo = '1684033'; % Taxonomicon
metaData.links.id_WoRMS = '398329'; % WoRMS
metaData.links.id_fishbase = 'Neotrygon-annotata'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Neotrygon_annotata}}'; 
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
bibkey = 'JacoBenn2010'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2010.02829.x}, ' ...
'author = {I. P. Jacobsen and M. B. Bennett}, ' ...
'year = {2010}, ' ...
'title  = {Age and growth of \emph{Neotrygon picta}, \emph{Neotrygon annotata} and \emph{Neotrygon kuhlii} from north-east {A}ustralia, with notes on their reproductive biology}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {77}, ' ...
'pages = {2405-2422}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Neotrygon-annotata.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  