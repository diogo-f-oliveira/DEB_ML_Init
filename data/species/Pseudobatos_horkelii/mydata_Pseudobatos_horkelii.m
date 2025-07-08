function [data, auxData, metaData, txtData, weights] = mydata_Pseudobatos_horkelii

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rhinopristiformes'; 
metaData.family     = 'Rhinobatidae';
metaData.species    = 'Pseudobatos_horkelii'; 
metaData.species_en = 'Brazilian guitarfish';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMcd','0iMm'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 05];                          
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
data.ab = 7*30.5;  units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';    
  temp.ab = C2K(15.6); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'CaltSide2019';   
  temp.am = C2K(15.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 22;     units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'CaltSide2019';
  comment.Lb = '15-18 cm';
data.Lp  = 90;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase'; 
  comment.Lp = '57-77 cm';
data.Li  = 138;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwi = 12.3e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00316*Li^3.08, see F1';

data.Ri  = 9/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(15.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4-12 pups per litter; assumed 1 litter per 1 yr';

% uni-variate data at f
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.798	45.941
0.825	53.205
1.797	69.080
1.817	55.838
1.817	57.119
1.821	67.373
2.210	60.351
2.211	62.487
2.236	65.479
2.246	58.431
2.800	68.723
2.800	69.577
2.802	74.063
2.802	76.199
2.803	77.694
3.832	83.747
3.845	86.311
4.826	90.438
4.827	93.856
5.819	96.488
6.823	99.335];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth','total length','female'};  
  temp.tL_f = C2K(15.6); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CaltSide2019';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
2.164	70.173
2.197	58.641
2.198	60.350
2.209	56.933
2.223	62.488
2.223	64.197
2.224	66.119
2.225	68.042
3.207	79.004
3.217	71.956
3.218	74.733
3.218	76.869
4.223	81.852
4.224	83.561
4.237	85.270
4.262	86.981
5.194	94.736
5.194	96.018
5.230	91.748
6.235	98.654
7.227	100.859];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth','total length','male'};  
  temp.tL_m = C2K(15.6); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CaltSide2019';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;
%weights.psd.v = 5 * weights.psd.v;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g = 0.0.00316 * (TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Ovoviviparous';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '78BZ9'; % Cat of Life
metaData.links.id_ITIS = '649701'; % ITIS
metaData.links.id_EoL = '51263479'; % Ency of Life
metaData.links.id_Wiki = 'Pseudobatos_horkelii'; % Wikipedia
metaData.links.id_ADW = 'Rhinobatos_horkelii'; % ADW
metaData.links.id_Taxo = '5618639'; % Taxonomicon
metaData.links.id_WoRMS = '1043490'; % WoRMS
metaData.links.id_fishbase = 'Pseudobatos-horkelii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudobatos_horkelii}}'; 
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
bibkey = 'CaltSide2019'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jfb.14123}, ' ...
'author = {Fabio P. Caltabellotta and Zachary A. Siders and Debra J. Murie and Fabio S. Motta and Gregor M. Cailliet and Otto B. F. Gadig}, ' ... 
'year = {2019}, ' ...
'title = {Age and growth of three endemic threatened guitarfishes \emph{Pseudobatos horkelii}, \emph{P. percellens} and \emph{Zapteryx brevirostris} in the western {S}outh {A}tlantic {O}cean}, ' ...
'journal = {J Fish Biol.}, ' ...
'volume = {95}, ' ...
'pages = {1236-1248}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pseudobatos-horkelii.html}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 