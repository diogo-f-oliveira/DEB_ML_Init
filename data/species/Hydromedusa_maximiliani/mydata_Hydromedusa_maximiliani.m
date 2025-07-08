function [data, auxData, metaData, txtData, weights] = mydata_Hydromedusa_maximiliani
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Chelidae';
metaData.species    = 'Hydromedusa_maximiliani'; 
metaData.species_en = 'Brazilian snake-necked turtle'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0bTd', 'biFc'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 07];

%% set data
% zero-variate data

data.ab = 275;     units.ab = 'd';    label.ab = 'age at birth';                      bibkey.ab = 'arkive';
  temp.ab = C2K(24);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '250 till 300 d, all temps are guessed';
data.tp = 9*365;     units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'MartSouz2008';
  temp.tp = C2K(24);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 17*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'MartSouz2008';
  temp.tpm = C2K(24);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
  comment.tpm = 'between 15 and 20 yr';
data.am = 100*365;     units.am = 'd';    label.am = 'life span';                      bibkey.am = 'MartSouz2008';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 2.85; units.Lb = 'cm';   label.Lb = 'plastron length at birth';              bibkey.Lb = 'NoveSous2008';
data.Lp = 8.8; units.Lp = 'cm';    label.Lp = 'plastron length at puberty for female'; bibkey.Lp = 'MartSouz2008';
data.Lpm= 10.2; units.Lpm= 'cm';   label.Lpm= 'plastron length at puberty for male';   bibkey.Lpm = 'MartSouz2008';
data.Li = 11.8; units.Li = 'cm';   label.Li = 'ultimate plastron length for females';  bibkey.Li = 'MartSouz2008';
data.Lim = 12.6; units.Lim = 'cm'; label.Lim = 'ultimate plastron length for males';   bibkey.Lim = 'MartSouz2008';

data.Wwb = 7.8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'NoveSous2008';
data.Wwi = 520; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';                  bibkey.Wwi = 'MartSouz2008';

data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';                bibkey.Ri  = 'arkive';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% length-change in length
data.LdL_f = [ ... % plastron length (cm), change in plastron length (cm/yr)
5.853657	0.002722
6.808200	0.002568
7.444221	0.002343
7.962306	0.001882
8.087201	0.001610
8.588713	0.001214
8.607660	0.001999
8.748419	0.001409
8.840384	0.001344
9.016432	0.001391
9.082129	0.000918
9.109832	0.001839
9.509122	0.000835
9.810890	0.000906
9.877840	0.000882
10.193888	0.000067
10.395050	0.000108
10.412909	0.000504
10.496381	0.000398
10.512377	0.000126
10.545654	0.000043
10.721701	0.000090
10.889521	0.000191
11.132584	0.000238
11.274514	0.000066
11.349923	0.000072
11.433791	0.000107
11.676525	0.000036
11.718410	0.000036
11.802377	0.000107
11.885949	0.000036];
%data.LdL_f(:,2) = data.LdL_f(:,2)/ 365; % convert yr to d. Outcommented, see D2
units.LdL_f   = {'cm', 'cm/d'};  label.LdL_f = {'plastron length', 'change in plastron length', 'female'};  
temp.LdL_f    = C2K(25);  units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f = 'MartSouz2008';
comment.LdL_f = 'Data for females';
%
data.LdL_m = [ ... % plastron length (cm), change in plastron length (cm/yr)
5.845313	0.002734
6.799807	0.002562
7.444221	0.002343
7.962306	0.001882
8.087185	0.001604
8.607627	0.001988
8.833525	0.001887
9.527360	0.001367
10.697642	0.000474
10.958383	0.000852
11.626807	0.000231
11.669319	0.000456
11.986934	0.000202
12.021019	0.000408
12.288223	0.000101
12.489039	0.000018
12.589612	0.000036];
%data.LdL_m(:,2) = data.LdL_m(:,2)/ 365; % convert yr to d. Outcommented, see D2
units.LdL_m   = {'cm', 'cm/d'};  label.LdL_m = {'plastron length', 'change in plastron length', 'male'};  
temp.LdL_m    = C2K(25);  units.temp.LdL_m = 'K'; label.temp.LdL_m = 'temperature';
bibkey.LdL_m = 'MartSouz2008';
comment.LdL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL_m = 5 * weights.LdL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LdL_f', 'LdL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hb only'; 
D2 = 'MartSouz2008 report in their Fig 1 growth rate in mm/yr, but this analysis assumes that it is actually in mm/d';
D3 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Links
metaData.links.id_CoL = '3N7L9'; % Cat of Life
metaData.links.id_ITIS = '551788'; % ITIS
metaData.links.id_EoL = '2815879'; % Ency of Life
metaData.links.id_Wiki = 'Hydromedusa_maximiliani'; % Wikipedia
metaData.links.id_ADW = 'Hydromedusa_maximiliani'; % ADW
metaData.links.id_Taxo = '48268'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Hydromedusa&species=maximiliani'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hydromedusa_maximiliani}}';
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
bibkey = 'MartSouz2008'; type = 'Article'; bib = [ ... 
'author = {F. I. Martins and F. L. Souza}, ' ... 
'year = {2008}, ' ...
'title = {Estimates of Growth of The {A}tlantic Rain Forest Freshwater Turtle \emph{Hydromedusa maximiliani} ({C}helidae)}, ' ...
'journal = {Journal of Herpetology}, ' ...
'number = {1}, ' ...
'volume = {42}, ' ...
'pages = {54--60}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NoveSous2008'; type = 'Article'; bib = [ ... 
'author = {I. A. Novelli and B. M. de Sousa}, ' ... 
'year = {2008}, ' ...
'title = {\emph{Hydromedusa maximiliani} ({B}razilian Snake-necked Turtle). {H}ATCHLING SIZE AND BODY MASS}, ' ...
'journal = {Herpetological Review}, ' ...
'number = {3}, ' ...
'volume = {39}, ' ...
'pages = {344--345}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'arkive'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.arkive.org/brazilian-snake-necked-turtle/hydromedusa-maximiliani/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

