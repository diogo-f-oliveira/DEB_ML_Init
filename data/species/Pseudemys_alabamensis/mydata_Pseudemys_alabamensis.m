function [data, auxData, metaData, txtData, weights] = mydata_Pseudemys_alabamensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Emydidae';
metaData.species    = 'Pseudemys_alabamensis'; 
metaData.species_en = 'Alabama red-bellied cooter';

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFp', 'biFm'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 05 05];

%% set data
% zero-variate data

data.ab = 55;     units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(31);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on P. concinna';
data.tp = 6*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(24);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on P. concinna';
data.am = 77*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'guess';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on P. concinna';

data.Lb = 3.3; units.Lb = 'cm';   label.Lb = 'carapace length at birth';      bibkey.Lb = 'Grah1971';
  comment.Lb = '25-31 mm';
data.Li = 32.25; units.Li = 'cm';   label.Li = 'ultimate carapace length';      bibkey.Li = 'Grah1971';

data.Ri  = 9/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4-9 eggs per clutch, 1 clutch per yr';
 
% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), plastron length (cm)
    0  3.32
    1  5.42
    2  7.31
    3  9.05
    4 11.81
    5 13.68
    6 15.27
    7 16.61
    8 17.96
    9 19.89
   10 21.13
   11 22.03];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2) / 0.93; % convert plastron to carapace length (guessed)
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'carapace length'};  
temp.tL    = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Grah1971';
comment.tL = 'Data from Hoyt''s and Gunner''s Exchange Ponds in Plymouth, Count';

% length-weight
data.LWw = [ ... % carapace length(cm), wet weight (g)
    4.16   15.2
    7.45   78.0
    8.46   96.2
    8.84  103.2
    9.17  147.7
   12.67  309.5
   12.94  337.5
   21.27 1338.0
   21.61 1358.0
   23.02 1558.1
   27.05 2483.5
   27.74 2499.3
   26.70 2689.8
   30.40 3477.4
   29.60 3547.0
   28.85 3724.2
   30.76 4070.9
   32.25 4858.6];
units.LWw   = {'cm', 'g'};  label.LWw = {'carapace length','wet weight'};  
bibkey.LWw = 'Grah1971';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = ''; label.psd.k = 'maintenance ratio';

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';   
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4NM9L'; % Cat of Life
metaData.links.id_ITIS = '173804'; % ITIS
metaData.links.id_EoL = '793829'; % Ency of Life
metaData.links.id_Wiki = 'Pseudemys_alabamensis'; % Wikipedia
metaData.links.id_ADW = 'Pseudemys_alabamensis'; % ADW
metaData.links.id_Taxo = '549747'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Pseudemys&species=alabamensis'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudemys_alabamensis}}';
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
bibkey = 'Grah1971'; type = 'Article'; bib = [ ... 
'author = {Terry E. Graham}, ' ... 
'year = {1971}, ' ...
'title = {Growth Rate of the Red-Bellied Turtle, \emph{Chrysemys rubriventris}, at {P}lymouth, {M}assachusetts}, ' ...
'journal = {Copeia}, ' ...
'volume = {1971(2))}, ' ...
'pages = {353-356}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/793829}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

