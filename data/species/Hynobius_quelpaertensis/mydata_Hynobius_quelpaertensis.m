function [data, auxData, metaData, txtData, weights] = mydata_Hynobius_quelpaertensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Hynobiidae';
metaData.species    = 'Hynobius_quelpaertensis'; 
metaData.species_en = 'Jeju salamander'; 

metaData.ecoCode.climate = {'Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwi'}; 
metaData.data_1     = {'tL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.ab = 5*7;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'amphibiaweb';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 49;  units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'Spar2014';
  temp.tj = C2K(15);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 3*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Spar2014';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 10*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Spar2014';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 5.5;     units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for males'; bibkey.Lp  = 'guess'; 
data.Lpm  = 5;     units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males'; bibkey.Lpm  = 'guess'; 
data.Li  = 6.11;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'Wiki';
  comment.Li = 'based on TL 11 cm, converted to SVL';  
data.Lim  = 7.78;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'Wiki';
  comment.Lim = 'based on TL 14 cm, converted to SVL';

data.Wwb = 1.11e-2;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.77 mm for Hynobius_yangi: pi/6*0.277^3';
data.Wwi = 2.41;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'guess based on Onychodactylus_japonicus: 9.65*(6.11/9.7)^3';

data.Ri  = 2*55/365;    units.Ri  = '#'; label.Ri  = 'max reprduction rate';     bibkey.Ri  = 'Spar2014';   
  temp.Ri = C2K(26); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '30-75 eggs per bag, 2 bags';

% univariate data
% time-length
data.tL_f = [... % time since birth (jr), SVL (cm)
0.38066	2.96935
0.40917	2.47119
2.98966	6.43253
2.98966	6.21669
3.95913	6.62921
3.98764	6.31368
4.98562	6.75934
5.95509	7.13866
5.99786	7.91889
6.95307	7.15264
6.95307	6.98661
7.95105	6.46929
7.95105	6.02101
8.97754	7.97747
9.97552	7.42695];
data.tL_f(:,1) = (data.tL_f(:,1)+0.5) * 365; % convert yr to d
units.tL_f  = {'d', 'cm'}; label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(15); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LeeMin2010';
comment.tL_f = 'Data for females';
%
data.tL_m = [... % time since birth (jr), SVL (cm)
0.38617	2.36595
0.40048	2.92881
2.97497	5.51749
2.98927	5.60021
3.01788	6.41135
3.96186	6.15910
3.99046	6.40732
4.00477	6.97018
4.00478	6.67217
4.97735	6.86682
4.97736	6.66814
4.97737	6.23768
5.97855	6.92890
6.00715	6.76322
6.00716	6.66388
6.00717	6.54798
6.97974	6.54396
6.97975	6.29561
7.99523	7.15234
7.99524	6.77154
8.98212	7.11514
8.99643	6.55217
8.99644	6.86674
9.95471	7.60780
9.95472	6.61443];
data.tL_m(:,1) = (data.tL_m(:,1)+0.5) * 365; % convert yr to d
units.tL_m  = {'d', 'cm'}; label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(15); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LeeMin2010';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f; 
weights.tL_m = 3 * weights.tL_m; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';     
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '6N2KV'; % Cat of Life
metaData.links.id_ITIS = '776870'; % ITIS
metaData.links.id_EoL = '1048038'; % Ency of Life
metaData.links.id_Wiki = 'Hynobius_quelpaertensis'; % Wikipedia
metaData.links.id_ADW = 'Hynobius_quelpaertensis'; % ADW
metaData.links.id_Taxo = '993356'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Hynobius+quelpaertensis'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hynobius_quelpaertensis}}';
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
bibkey = 'Spar2014'; type = 'Book'; bib = [ ... 
'author = {Sparreboom, Max}, ' ...
'year = {2014}, ' ...
'title  = {Salamanders of the Old World}, ' ...
'publisher = {KNNV publishing, Zeist}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LeeMin2010'; type = 'Article'; bib = [ ... 
'author = {Jung-Hyun Lee and Mi-Sook Min and Tae-Ho Kim and  Hae-Jun Baek and Hang Lee and Daesik Park}, ' ... 
'year = {2010}, ' ...
'title = {Age structure and growth rates of two {K}orean salamander species (\emph{Hynobius yangi} and \emph{Hynobius quelpaertensis}) from field populations}, ' ...
'journal = {Animal Cells and Systems}, ' ...
'volume = {14(4)}, ' ...
'pages = {315-322}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Hynobius+quelpaertensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

