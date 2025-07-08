function [data, auxData, metaData, txtData, weights] = mydata_Euglesa_casertana
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Sphaeriida'; 
metaData.family     = 'Sphaeriidae';
metaData.species    = 'Euglesa_casertana'; 
metaData.species_en = 'Peaclam'; 

metaData.ecoCode.climate = {'B','C','D'};
metaData.ecoCode.ecozone = {'TH','TN','TP','TA','TO'};
metaData.ecoCode.habitat = {'0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD', 'biHa'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 02]; 

%% set data
% zero-variate data

data.am = 1100; units.am = 'd';    label.am = 'life span';                   bibkey.am  = 'BurkHorn1981';   
  temp.am = C2K(13);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb  = 0.006; units.Lb  = 'cm';  label.Lb  = 'shell length at emergence';  bibkey.Lb  = 'guess';
  comment.Lb = 'based on Sphaerium corneum';
data.Lj  = 0.1; units.Lj  = 'cm';  label.Lj  = 'shell length at emergence';  bibkey.Lj  = 'BurkHorn1981';
data.Lp  = 0.25; units.Lp = 'cm';  label.Lp  = 'shell length at puberty';    bibkey.Lp  = 'guess';
data.Li  = 0.45; units.Li = 'cm';  label.Li  = 'ultimate shell height';      bibkey.Li  = 'Wiki';

data.Wdi  = 421e-6; units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight at SL 3.4 mm';  bibkey.Wdi = 'HoloHans1986';

data.Ni  = 60;   units.Ni  = '#'; label.Ni  = 'lifetime reprod output';   bibkey.Ni  = 'HoloHans1986';   
  temp.Ni = C2K(13);   units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = '20 eggs per clutch, 2-3 clutches per life time';

% uni-variate data
% time-length
data.tL = [ ... % time since emergence (d) , shell length (cm)
103.141	0.105
131.154	0.135
148.458	0.143
161.271	0.133
171.458	0.133
186.141	0.151
199.015	0.160
218.058	0.158
228.240	0.156
246.456	0.172
257.923	0.158
292.079	0.171
319.144	0.184
362.542	0.181
365+22.285	0.163
365+44.891	0.167
365+59.453	0.151
365+89.733	0.196
365+102.545	0.187
365+130.057	0.200
365+147.814	0.211
365+162.440	0.213
365+171.765	0.220
365+185.503	0.221
365+199.732	0.237
365+218.326	0.234
365+226.716	0.226
365+247.147	0.242
365+258.640	0.235
365+292.379	0.256
365+319.946	0.285
365+362.002	0.278
730+21.778	0.270
730+44.426	0.286
730+58.627	0.293
730+90.160	0.317
730+102.217	0.344
730+130.527	0.333
730+148.195	0.319
730+161.526	0.330
730+171.362	0.356
730+185.940	0.345
730+199.795	0.380
730+218.363	0.369
730+227.166	0.353
730+245.809	0.364
730+259.077	0.359
730+292.810	0.378
730+361.882	0.369];
data.tL(:,1) = data.tL(:,1) - 103; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(13);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BurkHorn1981';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Lb = 3 * weights.Lb;
weights.Lj = 3 * weights.Lj;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'Larvae of 1 mm shell length leave mantle, after some growth';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'This shell is hermaproditic';
metaData.bibkey.F1 = 'Wiki';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3C787'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '52590630'; % Ency of Life
metaData.links.id_Wiki = 'Euglesa'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5383094'; % Taxonomicon
metaData.links.id_WoRMS = '885716'; % WoRMS
metaData.links.id_molluscabase = '885716'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pisidium_casertanum}}';
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
bibkey = 'BurkHorn1981'; type = 'Article'; bib = [ ... 
'author = {Burky, Albert J. and Hornbach, Daniel J. and Way, C. M.}, ' ... 
'year = {1981}, ' ...
'title = {Brief Note: Growth of \emph{Pisidium casertanum} ({P}oli) in West {C}entral {O}hio}, ' ...
'journal = {Ohio Journal of Science}, ' ...
'volume = {81 (1)}, ' ...
'pages = {241-251}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HoloHans1986'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1600-0587.1986.tb01195.x}, ' ...
'author = {Ismo J. Holopainen and Ilkka Hanski}, ' ... 
'year = {1986}, ' ...
'title = {Life History Variation in \emph{Pisidium} ({B}ivalvia: {P}isidiidae)}, ' ...
'journal = {Holarctic Ecology}, ' ...
'volume = {9(2)}, ' ...
'pages = {85-98}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

