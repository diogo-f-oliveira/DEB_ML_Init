function [data, auxData, metaData, txtData, weights] = mydata_Triturus_marmoratus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Salamandridae';
metaData.species    = 'Triturus_marmoratus'; 
metaData.species_en = 'Marbled newt'; 

metaData.ecoCode.climate = {'Cfb', 'Csb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTh', 'jiFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am';  'Lp'; 'L_t'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_Tf'}; 

metaData.COMPLETE = 1.9; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 13];

%% set data
% zero-variate data;
data.ab = 17;      units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'salamanderland';    
  temp.ab = C2K(13.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '14 to 21 d';
data.tj = 2.75*30.5;     units.tj = 'd';    label.tj = 'time since birth at metam';   bibkey.tj = 'amphibiaweb';
  temp.tj = C2K(9); units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = '2.5 to 3 months';
data.tp = 6*365;     units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'CaetCast1993';
  temp.tp = C2K(9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 5*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'CaetCast1993';
  temp.tpm = C2K(9);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 25*365;  units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Li  = 7.55;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females'; bibkey.Li  = 'CaetCast1993';
data.Lim  = 6.85;  units.Lim = 'cm';  label.Lim = 'ultimate SVL for males';   bibkey.Lim  = 'CaetCast1993';

data.Wwb = 4.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'estimated from  egg diameter of 2 mm: pi/6*0.2^3'; 
data.Wwi = 10.6;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Triturus cristatus';
data.Wwim = 9.4;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';        bibkey.Wwim = 'guess';
  comment.Wwim = 'based on Triturus cristatus';

data.Ri  = 290/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '200-380 egg per clutch, 1 clutch per yr';

% univariate data
% time-length
% high altitude
data.tL_H = [ ... % time since birth (yr), SVL (cm); females, males
 0	3.002 NaN
 1	4.175 NaN
 2	4.580 4.481
 3	5.467 4.985
 4	5.981 5.469
 5	6.730 5.835
 6	6.722 6.102
 7	6.714 6.252
 8	6.893 6.440
 9	6.816 6.501
10	7.182 6.483
11	7.243 6.780
12	7.313 6.693
13	7.384 6.715
14	7.386 6.854
15	7.387 NaN];
data.tL_H(:,1) = (data.tL_H(:,1)+2.8) * 365; % convert yr to d
units.tL_H  = {'d', 'cm'};  label.tL_H = {'time since birth', 'SVL'};  
temp.tL_H   = C2K(9);  units.temp.tL_H = 'K'; label.temp.tL_H = 'temperature';
bibkey.tL_H = 'CaetCast1993'; treat.tL_H = {1, {'females','males'}};
comment.tL_H = 'Data for north high altitude, NP Peneda Geres (Portugal), 1500 m alt, 4 C winter, 14 C summer';
% low altitude
data.tL_L = [ ... % time since birth (yr), SVL (cm); females, males
 0	3.090 NaN
 1	4.310 4.260
 2	4.910 4.910
 3	5.690 5.490
 4	6.440 5.940
 5	6.550 5.990
 6	6.760 6.030
 7	7.080 6.340
 8	7.230 6.700
 9	7.280 6.750
10	7.400 6.800
11	7.290 6.860
12	7.400 NaN];
data.tL_L(:,1) = (data.tL_L(:,1)+2.0) * 365; % convert yr to d
units.tL_L  = {'d', 'cm'};  label.tL_L = {'time since birth', 'SVL'};  
temp.tL_L   = C2K(14);  units.temp.tL_L = 'K'; label.temp.tL_L = 'temperature';
bibkey.tL_L = 'CaetCast1993'; treat.tL_L = {1, {'females','males'}};
comment.tL_L = 'Data for north low altitude, NP Peneda Geres (Portugal), 550 m alt, 9 C winter, 16 C summer';
% south
data.tL_S = [ ... % time since birth (yr), SVL (cm)
 0	2.833 2.675
 1	3.729 3.108
 2	4.409 4.123
 3	5.068 NaN
 4	5.274 4.959
 5	5.520 5.204
 6	5.657 5.243
 7	5.843 5.173
 8	5.892 5.231
 9	6.177 5.240
10  NaN   5.535
11  NaN   5.377
12  NaN   5.583];
data.tL_S(:,1) = (data.tL_S(:,1)+1.2) * 365; % convert yr to d
units.tL_S  = {'d', 'cm'};  label.tL_S = {'time since birth', 'SVL'};  
temp.tL_S   = C2K(18.5);  units.temp.tL_S = 'K'; label.temp.tL_S = 'temperature';
bibkey.tL_S = 'CaetCast1993'; treat.tL_S = {1, {'females','males'}};
comment.tL_S = 'Data for south, Castro Marim (Portugal), 50 m alt, 14 C winter, 23 C summer ';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Conversion of LAG to time since birth was done by adding 2.8 yr for north-hight data, 2.0 yr for north-low and 1.8 yr for south';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Hybridizes with T. cristatus';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '595FM'; % Cat of Life
metaData.links.id_ITIS = '668406'; % ITIS
metaData.links.id_EoL = '332572'; % Ency of Life
metaData.links.id_Wiki = 'Triturus_marmoratus'; % Wikipedia
metaData.links.id_ADW = 'Triturus_marmoratus'; % ADW
metaData.links.id_Taxo = '47336'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Triturus+marmoratus'; % AmphibiaWeb
metaData.links.id_AnAge = 'Triturus_marmoratus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Triturus_marmoratus}}';   
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
bibkey = 'CaetCast1993'; type = 'Article'; bib = [ ...  % 
'doi = {10.1163/156853893x00291}, ' ...
'author = {Caetano, M. H. and Castanet, J.}, ' ...
'title = {Variability and microevolutionary patterns in \emph{Triturus marmoratus} from {P}ortugal: age, size, longevity and individual growth}, ' ...
'journal = {Amphibia-Reptilia, , }, ' ...
'volume = {14(2)}, ' ...
'pages = {117–129}, ' ...
'year = {1993}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Triturus_marmoratus}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Triturus+marmoratus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'salamanderland'; type = 'Misc'; bib = ...
'howpublished = {\url{hhttps://salamanderland.com/articles/articles-caresheets/triturus-marmoratus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
