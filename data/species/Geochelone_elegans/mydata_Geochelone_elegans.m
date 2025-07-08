function [data, auxData, metaData, txtData, weights] = mydata_Geochelone_elegans
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Testudinidae';
metaData.species    = 'Geochelone_elegans'; 
metaData.species_en = 'Indian star tortoise'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTh','0iTf','0iTi'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biH'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 05 09];

%% set data
% zero-variate data

data.ab = 130;     units.ab = 'd';    label.ab = 'age at birth';      bibkey.ab = 'ADW';
  temp.ab = C2K(29);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '90 till 170 d';
data.tp = 10*365;     units.tp = 'd';    label.tp = 'time since birth at puberty';      bibkey.tp = 'ADW';
  temp.tp = C2K(29);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tpm = '8-12 yr';
data.tpm = 7*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'ADW';
  temp.tpm = C2K(29);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
  comment.tpm = '6-8 yr';
data.am = 24.3*365;     units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(29);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 3.5;  units.Lb = 'cm';   label.Lb = 'carapace length at birth';   bibkey.Lb = 'ADW';
data.Li = 38;  units.Li = 'cm';   label.Li = 'ultimate carapace length for female';   bibkey.Li = 'ADW';
data.Lim = 20;  units.Lim = 'cm';   label.Lim = 'ultimate carapace length for male';   bibkey.Lim = 'ADW';

data.Ww0 = 16.3; units.Ww0 = 'g';   label.Ww0 = 'initial wet weigh';                bibkey.Ww0 = 'Vyas1997';
data.Wwb = 35; units.Wwb = 'g';   label.Wwb = 'wet weigh at birth';                bibkey.Wwb = 'ADW';
   comment.Wwb = '25-45 g';
data.Wwi = 6.6e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';    bibkey.Wwi = 'ADW';

data.Ri  = 7*4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';            bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(29);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-10 eggs/clutch; till 9 clutches per yr';

% uni-variate data

% time-length
data.tL = [ ... % time  since birth (yr), length of carapace (cm)
    1  6.5
    2  7.5
    3  9.0
    4 11.6
    5 14
    6 15
    7 16
    8 20.30];
data.tL(:,1) = data.tL(:,1) * 365;
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'carapace length'};  
temp.tL    = C2K(29);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Vyas1997';
comment.tL = 'Data for a female';

% time-weight
data.tWw = [ ... % time  since birth (yr), weight (g)
    1   65
    2  125
    3  194
    4  395
    5  650
    6  850
    7 1150
    8 1450];
data.tWw(:,1) = data.tWw(:,1) * 365;
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'weight'};  
temp.tWw    = C2K(29);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Vyas1997';
comment.tWw = 'Data for a female';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;
weights.Ww0 = 0 * weights.Ww0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
weights.psd.k = 3 * weights.psd.k_J; weights.psd.k_J = 0;
%weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '6KC84'; % Cat of Life
metaData.links.id_ITIS = '551777'; % ITIS
metaData.links.id_EoL = '794301'; % Ency of Life
metaData.links.id_Wiki = 'Geochelone_elegans'; % Wikipedia
metaData.links.id_ADW = 'Geochelone_elegans'; % ADW
metaData.links.id_Taxo = '48654'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Geochelone&species=elegans'; % ReptileDB
metaData.links.id_AnAge = 'Geochelone_elegans'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Geochelone_elegans}}';
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
bibkey = 'Vyas1997'; type = 'Article'; bib = [ ... 
'doi = {10.11609/zp.v12i1.4970}, ' ...
'author = {Raju Vyas}, ' ... 
'year = {1997}, ' ...
'title = {Notes on the growth and maturity of the {I}ndian star tortoise (\emph{Geochelone elegans})}, ' ...
'journal = {Zoo''s Print}, ' ...
'volume = {12(1)}, ' ...
'pages = {6-7}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Geochelone_elegans/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Geochelone_elegans}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

