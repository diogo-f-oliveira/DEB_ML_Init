function [data, auxData, metaData, txtData, weights] = mydata_Megalonaias_nervosa
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Unionidae';
metaData.species    = 'Megalonaias_nervosa'; 
metaData.species_en = 'Washboard'; 

metaData.ecoCode.climate = {'Cfb','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D','Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li';  'Wwi'; 'Ri'};
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; 

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};                             
metaData.email_cur  = {'sta@akvaplan.niva.no'};                 
metaData.date_acc   = [2021 02 05];      


%% set data
% zero-variate data

data.ab = 10;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'unio';   
  temp.ab = C2K(16);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 43*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'ChriDavi2000';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = .02;   units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'unio';  
data.Lj  = .03;   units.Lj  = 'cm';  label.Lj  = 'shell length at settlement';   bibkey.Lj  = 'guess';  
data.Lp  = 7;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'gues'; 
data.Li  = 16.75;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'ChriDavi2000';

data.Wwi  = 169; units.Wwi  = 'g';  label.Wwi  = 'ultimate dry weight';  bibkey.Wwi  = 'guess';
 comment.Wwi = 'based on size-corrected value for Unio_tumidus : 14*(16.75/7.3)^3';

data.Ri = 607455/365;    units.Ri = '1/d';    label.Ri = 'reproduction rate at SL 11.71 cm'; bibkey.Ri = 'Haag2013';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
 
% uni-variate data
  
% time-length
data.tL = [ ... % time since birth (yr), shell depth (cm)
4.043	2.042
5.220	2.865
6.192	3.927
6.192	3.714
6.192	3.582
8.393	5.014
9.263	5.492
11.310	6.393
15.046	8.330
16.223	8.381
16.325	8.062
17.298	7.610
17.298	7.875
18.117	8.698
18.168	8.220
18.168	8.459
18.936	8.644
19.089	9.069
19.857	8.962
19.908	9.228
19.908	9.494
19.959	8.324
20.931	8.244
20.931	8.509
20.931	8.935
22.211	8.561
22.825	9.358
24.872	9.196
24.872	10.286
31.064	10.731
39.918	13.486
40.993	10.269
43.142	12.579];
data.tL(:,1) = 365 * (0 + data.tL(:,1));
data.tL(:,2) = data.tL(:,2) * 1.34; % convert shell depth to shell length based on photo
units.tL = {'d', 'cm'}; label.tL = {'time', 'shell length'};  
temp.tL = C2K(8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ChriDavi2000';
comment.tL = 'Data from Cache River, Arkansas; mean temperature is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Lj = 0 * weights.Lj;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
weights.psd.p_M = 0;
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '6QW49'; % Cat of Life
metaData.links.id_ITIS = '80279'; % ITIS
metaData.links.id_EoL = '396027'; % Ency of Life
metaData.links.id_Wiki = 'Megalonaias_nervosa'; % Wikipedia
metaData.links.id_ADW = 'Megalonaias_nervosa'; % ADW
metaData.links.id_Taxo = '459312'; % Taxonomicon
metaData.links.id_WoRMS = '857346'; % WoRMS
metaData.links.id_molluscabase = '857346'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Quadrula_quadrula}}';
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
bibkey = 'ChriDavi2000'; type = 'Article'; bib = [ ...
'author = {Christian, Alan D. and Davidson, Chris L. and Posey, William R. and Rust, Peter J. and Farris, Jerry L. and Harris, John L. and Harp, George L.}, ' ... 
'year = {2000}, ' ...
'title = {Growth Curves of Four Species of Commercially Valuable Freshwater Mussels ({B}ivalva: {U}nionidae)}, ' ...
'journal = {Journal of the Arkansas Academy of Science}, ' ...
'volume = {54}, ' ...
'pages = {9}, ' ...
'howpublished = {\url{http://scholarworks.uark.edu/jaas/vol54/iss1/9}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'unio'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.unio.lu/freshwater-mussel/biology/reproduction-cycle/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Haag2013'; type = 'Article'; bib = [ ...
'doi = {10.1111/brv.12028}, ' ...
'author = {Wendell R. Haag }, ' ... 
'year = {2013}, ' ...
'title = {The role of fecundity and reproductive effort in defining life-history strategies of {N}orth {A}merican freshwater mussels}, ' ...
'journal = {Biol. Rev.}, ' ...
'volume = {88}, ' ...
'pages = {745-766}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

