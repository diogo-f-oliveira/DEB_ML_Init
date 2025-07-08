  function [data, auxData, metaData, txtData, weights] = mydata_Emydocephalus_ijimae
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Elapidae';
metaData.species    = 'Emydocephalus_ijimae'; 
metaData.species_en = 'Ijima''s sea snake'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'biMr'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvfe'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 16]; 

%% set data
% zero-variate data
data.ab = 6*30.5;         units.ab = 'd';  label.ab = 'age at birth';          bibkey.ab = 'MasuHide2003';
  temp.ab = C2K(24); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 20*365;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'guess';
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lb = 28;      units.Lb = 'cm';     label.Lb = 'SVL at birth';  bibkey.Lb = 'MasuHide2003';
  comment.Lb = '226 to 342 mm';
data.Lp = 50;     units.Lp = 'cm';     label.Lp = 'SVL at puberty for females'; bibkey.Lp = 'Masumats2003'; 
data.Lpm = 55;     units.Lpm = 'cm';     label.Lpm = 'SVL at puberty for males';  bibkey.Lpm = 'Masumats2003';
data.Li = 85.5;     units.Li = 'cm';     label.Li = 'ultimate SVL for females';  bibkey.Li = 'MasuHide2003';
data.Lim = 78.5;     units.Lim = 'cm';     label.Lim = 'ultimate SVL for males';  bibkey.Lim = 'MasuHide2003';

data.Wwi = 600;    units.Wwi = 'g';     label.Wwi = 'ultimate weight for females'; bibkey.Wwi = 'MasuHide2003';
data.Wwim = 364;   units.Wwim = 'g';    label.Wwim = 'ultimate weight for males';  bibkey.Wwim = 'MasuHide2003';
  comment.Wwim = 'based on (Lim/Li)^3*Wwim';

data.Ri = 4/365;  units.Ri = '#/d';  label.Ri = 'reprod rate';  bibkey.Ri = 'Masumats2003';   
  temp.Ri = C2K(24); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% length - change in length
data.LdL_f = [ ... % time (d), SVL (cm)
35.15203	0.04854
39.79248	0.09218
43.88433	0.01135
46.62781	0.03184
49.09634	0.09256
60.00898	0.00641
63.32593	0.05727
64.86469	0.03564
66.50105	0.04474
67.03681	0.01780
67.35960	-0.00345
73.06444	0.01324
75.07004	0.02539
75.59577	0.03639
75.97554	-0.00042
79.02367	0.06751
81.30763	0.02653
82.21082	0.00945
82.58317	0.00072
83.42557	0.01362
84.48405	0.00907
85.12092	-0.00042];
units.LdL_f  = {'cm', 'cm/d'};  label.LdL_f = {'SVL', 'change in SVL', 'female'};  
temp.LdL_f   = C2K(24);  units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f = 'MasuHide2003';
comment.LdL_f = 'data for females';
%
data.LdL_m = [ ... % SVL (cm), chnage in SVL (cm/d)
32.26317	0.04337
33.67870	0.05622
35.03497	0.08157
35.63498	0.04254
39.04930	0.06104
40.07054	0.12238
41.87597	0.09508
42.08369	0.00075
54.55488	0.02628
55.29018	0.03043
56.45269	0.02359
57.07945	0.03380
57.61641	0.01448
58.36168	-0.00031
58.40099	0.02507
58.54706	0.04779
58.82940	0.01180
58.84776	-0.02305
60.85213	-0.02801
61.13867	0.02805
61.30948	0.00380
62.16450	-0.01932
62.31236	-0.00001
62.86967	0.04203
63.37610	-0.01935
64.19162	0.03253
64.65355	0.05563
65.65783	-0.05083
65.94716	-0.00008
66.33547	0.06280
66.56653	0.02415
66.93129	0.03172
66.95264	-0.00881
66.98696	0.02604
67.04523	0.01543
67.31939	-0.00503
68.04691	0.01390
68.30791	0.01844
69.21521	-0.00393
69.45765	0.03584
69.73521	0.00894
69.73621	0.00705
69.75397	-0.02666
69.78609	0.01235
70.12511	-0.03122
70.16462	-0.00622
70.42322	0.00287
70.42522	-0.00092
70.76922	0.04605
71.88245	0.03277
72.01195	-0.01307
72.42659	-0.00020];
units.LdL_m  = {'cm', 'cm/d'};  label.LdL_m = {'SVL', 'change in SVL', 'male'};  
temp.LdL_m   = C2K(24);  units.temp.LdL_m = 'K'; label.temp.LdL_m = 'temperature';
bibkey.LdL_m = 'MasuHide2003';
comment.LdL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL_f = 3 * weights.LdL_f;
weights.LdL_m = 3 * weights.LdL_m;
weights.Li = 100 * weights.Li;
weights.Lim = 100 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
                  
%% Group plots
set1 = {'LdL_f','LdL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Feeds on fish eggs';
metaData.bibkey.F1 = 'MasuHide2003'; 
F2 = 'ovoviviparous';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6F8FR'; % Cat of Life
metaData.links.id_ITIS = '700504'; % ITIS
metaData.links.id_EoL = '46559567'; % Ency of Life
metaData.links.id_Wiki = 'Emydocephalus_ijimae'; % Wikipedia
metaData.links.id_ADW = 'Emydocephalus_ijimae'; % ADW
metaData.links.id_Taxo = '645788'; % Taxonomicon
metaData.links.id_WoRMS = '344037'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Emydocephalus&species=ijimae'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Emydocephalus_ijimae}}';
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
bibkey = 'MasuHide2003'; type = 'Article'; bib = [ ...  
'author = {Gen Masunaga and Hidetoshi Ota}, ' ...
'year = {2003}, ' ...
'title = {Growth and Reproduction of the Sea Snake, \emph{Emydocephalus ijimae}, in the {C}entral {R}yukyus, {J}apan: a Mark and Recapture Study}, ' ... 
'journal = {Zoological Science}, ' ...
'volume = {20}, '...
'pages = {461-470}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'Masumats2003'; type = 'Article'; bib = [ ...  
'author = {Masunaga, G and Matsuura, R and Yoshino, T and Ota, Hidetoshi}, ' ...
'year = {2003}, ' ...
'title = {Reproductive biology of the viviparous sea snake \emph{Emydocephalus ijimae} ({R}eptilia: {E}lapidae: {H}ydrophiinae) under a seasonal environment in the northern hemisphere}, ' ... 
'journal = {Herpetological Journal}, ' ...
'volume = {7}, '...
'pages = {113-119}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 

